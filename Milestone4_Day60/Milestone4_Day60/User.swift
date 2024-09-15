//
//  User.swift
//  Milestone4_Day60
//
//  Created by Jesse Sheehan on 9/15/24.
//

import Foundation

struct User: Codable {
    let id: String
    let isActive: Bool
    let name: String
    let email: String
    let age: Int
    let company: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
    
}
