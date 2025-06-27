//
//  NetworkSessionInterface.swift
//  NetworkKit
//
//  Created by Ibrahim Abdul Aziz on 27/06/2025.
//

import Foundation
import Combine

public protocol NetworkSessionInterface {
    func execute<T: Codable>(_ request: BaseRequest, model: T.Type) -> AnyPublisher<T, NetworkError>
}
