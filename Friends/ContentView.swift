//
//  ContentView.swift
//  Friends
//
//  Created by Parth Antala on 2024-07-13.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query var users: [User]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(users) { user in
                        NavigationLink(destination: DetailView(user: user)) {
                            Text("\(user.name)")
                        }
                    }
                }
                .onAppear {
                    if users.isEmpty {
                        Task {
                            await loadUser()
                        }
                    }
                }
            }
           
        }
    }
    
    func loadUser() async {
        
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decodedUsers = try decoder.decode([User].self, from: data)
                
                DispatchQueue.main.async {
                    if users.isEmpty {
                        for user in decodedUsers {
                            modelContext.insert(user)
                        }
                    } else {
                        print("Already Stored in SwiftData")
                    }
                }
            } catch {
                print("Fetch or decode failed: \(error.localizedDescription)")
            }
    }
}

#Preview {
    ContentView()
}
