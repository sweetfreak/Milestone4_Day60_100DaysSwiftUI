//
//  Friend.swift
//  Milestone4_Day60
//
//  Created by Jesse Sheehan on 9/15/24.
//

import Foundation

struct Friend: Codable, Identifiable, Hashable {
    let id: UUID
    let name: String
}
