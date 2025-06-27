// The Swift Programming Language
// https://docs.swift.org/swift-book

import Combine
import Foundation

public final class NetworkManager: NetworkSessionInterface, @unchecked Sendable {
    
    public static let shared = NetworkManager()
    
    private init() {}
    
    public func execute<T: Decodable>(_ request: BaseRequest, model: T.Type) -> AnyPublisher<T, NetworkError> {
        let urlRequest = request.asURLRequest()
        let decoder = JSONDecoder()
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response in
                try self.handleResponse(response, data: data)
            }
            .decodeWrappedResponse(model, using: decoder)
            .mapError { error in
                (error as? NetworkError) ?? NetworkError(errorType: .unknownError)
            }
            .eraseToAnyPublisher()
    }
    
    private func handleResponse(_ response: URLResponse, data: Data) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError(errorType: .invalidResponse)
        }
        switch httpResponse.statusCode {
        case 200...299:
            return data
        case 400...499, 500...599:
            throw NetworkError(errorType: .serverError)
        default:
            throw NetworkError(errorType: .unknownError)
        }
    }
}

extension Publisher where Output == Data, Failure == Error {
    func decodeWrappedResponse<T: Decodable>(_ type: T.Type, using decoder: JSONDecoder) -> AnyPublisher<T, Error> {
        return tryMap { data in
            do {
                // Try to decode BaseResponse<T>
                let wrapped = try decoder.decode(BaseResponse<T>.self, from: data)
                guard let data = wrapped.data else {
                    throw NetworkError(errorType: .decodingError)
                }
                return data
            } catch let wrappedError {
                do {
                    // Fallback: decode plain T
                    let direct = try decoder.decode(T.self, from: data)
                    return direct
                } catch let directError {
                    throw directError
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
