//
//  ContentView.swift
//  Friends
//
//  Created by Parth Antala on 2024-07-13.
//

import SwiftUI

struct ContentView: View {
    
    @State var users: [User] = []
    
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
                    Task {
                        await loadUser()
                    }
                }
            }
           
        }
    }
    
    func loadUser() async {
        
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let decodedUsers = try decoder.decode([User].self, from: data)
                    DispatchQueue.main.async {
                        self.users = decodedUsers
                    }
                } catch {
                    print("Decoding failed: \(error.localizedDescription)")
                }
            } else if let error = error {
                print("Fetch failed: \(error.localizedDescription)")
            }
        }.resume()
    }
}

#Preview {
    ContentView()
}
