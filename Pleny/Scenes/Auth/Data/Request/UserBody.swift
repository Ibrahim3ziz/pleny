//
//  UserBody.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 30/06/2025.
//

import Foundation

struct UserBody: Encodable {
    var username: String
    var password: String
    var expiresInMins: Int?
}
