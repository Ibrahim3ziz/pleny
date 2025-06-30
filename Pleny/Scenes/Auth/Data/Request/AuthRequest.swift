//
//  AuthRequest.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 30/06/2025.
//

import Foundation
import NetworkKit

struct AuthRequest: BaseRequest {
    
    var requestBody: UserBody
    
    var scheme: String = "https"
    
    var baseURL: String = "dummyjson.com"
    
    var path: String = "auth/login"
    
    var method: NetworkKit.HTTPMethod = .post
    
    var headers: [String : String]? = ["Content-Type": "application/json"]
    
    var parameter: [String : String]? = [:]
    
    var body: [String : Any]? {
        return ["username": requestBody.username,
                "password": requestBody.password,
                "expiresInMins": requestBody.expiresInMins ?? 30]
    }
}
