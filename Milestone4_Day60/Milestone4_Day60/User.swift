//
//  User.swift
//  Milestone4_Day60
//
//  Created by Jesse Sheehan on 9/15/24.
//
import SwiftData
import Foundation

@Model
class User: Codable {
    enum CodingKeys:CodingKey {
        case id, isActive, name, email, age, company, address, about, registered, tags, friends
    }
    
    var id: UUID
    var isActive: Bool
    var name: String
    var email: String
    var age: Int
    var company: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    static let example = User(
        id: UUID(),
        isActive: true,
        name: "Jesse",
        email: "Jesse@gmail.com",
        age: 32,
        company: "SelfEmployed",
        address: "1122 Boogie Woogie Avenue",
        about: "He's learning SwiftUI",
        registered: Date(),
        tags: ["Friendly", "Smart", "LovesSwiftUI"],
        friends: [Friend(id: UUID(),name: "Max"), Friend(id: UUID(),name: "Zoe")]
    )
    
    init(id: UUID, isActive: Bool, name: String, email: String, age: Int, company: String, address: String, about: String, registered: Date, tags: [String], friends: [Friend]) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.email = email
        self.age = age
        self.company = company
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(UUID.self, forKey: .id)
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        self.name = try container.decode(String.self, forKey: .name)
        
        //let stringAge = try container.decode(String.self, forKey: .age)
        //self.age = Int(stringAge) ?? 0
        self.age = try container.decode(Int.self, forKey: .age)
        
        self.company = try container.decode(String.self, forKey: .company)
        self.email = try container.decode(String.self, forKey: .email)
        self.address = try container.decode(String.self, forKey: .address)
        self.about = try container.decode(String.self, forKey: .about)
        self.registered = try container.decode(Date.self, forKey: .registered)
        self.tags = try container.decode([String].self, forKey: .tags)
        self.friends = try container.decode([Friend].self, forKey: .friends)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.id, forKey: .id)
        try container.encode(self.isActive, forKey: .isActive)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.email, forKey: .email)
        
        //try container.encode(String(self.age), forKey: .age)
        try container.encode(self.age, forKey: .age)
        
        try container.encode(self.company, forKey: .company)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.about, forKey: .about)
        try container.encode(self.registered, forKey: .registered)
        try container.encode(self.tags, forKey: .tags)
        try container.encode(self.friends, forKey: .friends)
        
    }
}
