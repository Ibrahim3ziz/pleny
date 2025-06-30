//
//  FeedRequest.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 28/06/2025.
//

import Foundation
import NetworkKit

struct FeedRequest: BaseRequest {
    
    var scheme: String = "https"
    
    var baseURL: String = "dummyjson.com"
    
    var path: String = "posts"
    
    var method: NetworkKit.HTTPMethod = .get
    
    var headers: [String : String]? = [:]
    
    var parameter: [String : String]? = [:]
    
    var body: [String : Any]? = nil
}
