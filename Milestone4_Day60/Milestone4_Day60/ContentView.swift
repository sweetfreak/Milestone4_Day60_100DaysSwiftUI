//
//  ContentView.swift
//  Milestone4_Day60
//
//  Created by Jesse Sheehan on 9/15/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    //@State private var users = [User]()
    @Query(sort: \User.name) private var users: [User]
    
    
    var body: some View {
        NavigationStack {
            List(users) { user in
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
        
        do {
            let url = URL(string: "https://hws.dev/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
//
//            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
//                users = decodedResponse
//            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            //users = try decoder.decode([User].self, from: data)
            let downloadedUsers = try decoder.decode([User].self, from: data)
            
            //This code creates a new model context, but then you lose the auto-save feature. This will make the swiftData appear all at once instead of downloading and inserting itself, user by user
            let insertContext = ModelContext(modelContext.container)
            
            //adds alls users to modelContext for SwiftData
            for user in downloadedUsers {
                //modelContext.insert(user)
                insertContext.insert(user) //adds it to the newly created container
            }
            //ask insertContainer to save itself
            try insertContext.save()
            
            } catch {
            print("Invalid Data")
        }
    }
    
}


#Preview {
    ContentView()
}
