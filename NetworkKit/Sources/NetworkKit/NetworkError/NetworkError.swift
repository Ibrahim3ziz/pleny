//
//  NetworkError.swift
//  NetworkKit
//
//  Created by Ibrahim Abdul Aziz on 27/06/2025.
//

import Foundation

public struct NetworkError: LocalizedError, Decodable {
    var message: String?
    var specificError: DefaultErrors?
    
    init(errorType: DefaultErrors) {
        self.specificError = errorType
    }
}

public enum DefaultErrors: Decodable, Sendable {
    case invalidResponse
    case serverError
    case decodingError
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .serverError:
            return "Unfortunately Server error!, try again later"
        case .unknownError:
            return "Unfortunately, SomeThing went wrong"
        case .invalidResponse:
            return "There is error occurred , try again later"
        case .decodingError:
            return "Failed to decoded data received from server"
        }
    }
}
