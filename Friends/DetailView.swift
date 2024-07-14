//
//  DetailView.swift
//  Friends
//
//  Created by Parth Antala on 2024-07-13.
//

import SwiftUI

struct DetailView: View {
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.largeTitle)
                .padding(.bottom)
            Text("\(user.registered)")
            Text("Age: \(user.age)")
            Text("Email: \(user.email)")
            Text("Address: \(user.address)")
            Text("Company: \(user.company)")
            Text("About: \(user.about)")
                .padding(.bottom)
            
            Text("Friends:")
                .font(.headline)
            List(user.friends) { friend in
                Text(friend.name)
            }
        }
        .padding()
        .navigationTitle(user.name)
    }
}

//#Preview {
//    DetailView(user: User(id: UUID(), name: "", age: 0, company: "", email: "", address: "", about: "", registered: Date.now, tags: [], friends: []))
//}
