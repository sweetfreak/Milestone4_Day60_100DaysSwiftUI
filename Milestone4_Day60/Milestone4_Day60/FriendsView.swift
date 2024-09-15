//
//  FriendsView.swift
//  Milestone4_Day60
//
//  Created by Jesse Sheehan on 9/15/24.
//

import SwiftUI



struct FriendsView: View {

    var friends: [Friend]

    var body: some View {
        VStack(alignment: .leading) {
            
            ForEach(friends) { friend in
                Text("- \(friend.name)")
                
//                NavigationLink() {
//                    UserView(user: User(id: friend.id, name: friend.name))
//                    
//                }
            }
        }
    }
}

#Preview {
    FriendsView(friends: [Friend(id: "1", name: "Jesse"), Friend(id: "2", name: "John")])
}
