//
//  ContentView.swift
//  Milestone4_Day60
//
//  Created by Jesse Sheehan on 9/15/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List(users/*, id: \.id*/) { user in
                HStack {
                    Circle()
                        .fill(user.isActive ? .green : .red)
                        .frame(width: 30)
                    
                    NavigationLink(user.name) {
                        UserView(user:user)
                    }
                    .foregroundStyle(user.isActive ? .green : .red)
                    .font(.title2)
                    }
                }
                .navigationTitle("Users")
                .task {
                    await loadData()
                }
            }
        }
//        NavigationStack {
//            List(users) { user in
//                NavigationLink(value: user) {
//                    HStack {
//                        Circle()
//                            .fill(user.isActive ? .green : .red)
//                            .frame(width: 30)
//
//                        Text(user.name)
//                    }
//                }
//            }
//            .navigationTitle("Friendface")
//            .navigationDestination(for: User.self) { user in
//                Text(user.name)
//            }
//            .task {
//                await loadData()
//            }
//        }
//    }
    
    
    func loadData() async  {
        guard users.isEmpty else {
            return
        }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
//            
//            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
//                users = decodedResponse
//            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            users = try decoder.decode([User].self, from: data)
            
            } catch {
            print("Invalid Data")
        }
    }
    
}


#Preview {
    ContentView()
}
