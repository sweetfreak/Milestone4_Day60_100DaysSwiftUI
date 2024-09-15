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
            List(users, id: \.id) { user in
                VStack {
                    NavigationLink(user.name) {
                        UserView(user:user)
                    }.foregroundStyle(user.isActive ? .green : .red)
                    
                }
                    .font(.headline)
              
            }
            .navigationTitle("Users")
            .task {
                await loadData()
            }
            
        }
        
        
    }
    
    
    func loadData() async  {
        if !users.isEmpty {
            return
        }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                users = decodedResponse
                
            }
        } catch {
            print("Invalid Data")
        }
    }
    
}


#Preview {
    ContentView()
}
