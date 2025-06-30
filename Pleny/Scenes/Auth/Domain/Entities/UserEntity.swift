//
//  UserEntity.swift
//  Pleny
//
//  Created by Ibrahim Abdul Aziz on 30/06/2025.
//

import Foundation

struct UserEntity: Codable {
    let id: Int
    let username, email, firstName, lastName: String
    let gender: String
    let image: String
    let accessToken, refreshToken: String
}
