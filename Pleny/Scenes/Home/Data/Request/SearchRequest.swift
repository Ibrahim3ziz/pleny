//
//  SearchRequest.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 30/06/2025.
//

import Foundation
import NetworkKit

struct SearchRequest: BaseRequest {
    
    var query: String
    
    var scheme: String = "https"
    
    var baseURL: String = "dummyjson.com"
    
    var path: String = "posts/search"
    
    var method: HTTPMethod = .get
    
    var headers: [String : String]? = [:]
    
    var parameter: [String : String]? {
        return ["q": query]
    }
    
    var body: [String : Any]? = nil
}
