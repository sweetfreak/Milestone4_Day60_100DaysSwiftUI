//
//  Friend.swift
//  Milestone4_Day60
//
//  Created by Jesse Sheehan on 9/15/24.
//
import SwiftData
import Foundation

@Model
class Friend: Codable {
    enum CodingKeys:CodingKey {
        case id
        case name
    }
    
    var id: UUID
    var name: String
    
    init (id: UUID, name: String) {
        self.id = id
        self.name = name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self , forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }
}
