//
//  UserView.swift
//  Milestone4_Day60
//
//  Created by Jesse Sheehan on 9/15/24.
//

import SwiftUI

struct UserView: View {

    var user: User
    let dateFormatter = ISO8601DateFormatter()
    
    var body: some View {
        NavigationStack() {
            List {
                Section("About \(user.name)") {
                    Text("Email: \(user.email)")
                    Text("Age: \(user.age)")
                    Text("Company: \(user.company)")
                    Text("Address: \(user.address)")
                    Text("Registration Date: \(dateFormatter.date (from: user.registered)!.formatted(date: .abbreviated, time: .omitted))")
                }
                Section("About") {
                    Text(user.about)
                }
                
                Section("Tags") {
                    
                    Text(user.tags.joined(separator: ", "))
                }
                Section("Friends List") {
                    FriendsView(friends: user.friends)
            }
                
                Text("User's ID: \(user.id)")
                    .font(.caption)
            }
            .navigationTitle(user.name)
        }
    }
        
}

#Preview {
    UserView(user: User(id: UUID(), isActive: true, name: "Jesse", email: "Jesse@gmail.com", age: 32, company: "SelfEmployed", address: "1122 Boogie Woogie Avenue", about: "He's learning SwiftUI", registered:  "2015-11-10T01:47:18-00:00", tags: ["Friendly", "Smart", "LovesSwiftUI"], friends: [Friend(id: UUID(), name: "Max"), Friend(id: UUID(), name: "Zoe")]))
}
