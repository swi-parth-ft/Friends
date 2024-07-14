//
//  FriendsApp.swift
//  Friends
//
//  Created by Parth Antala on 2024-07-13.
//

import SwiftUI
import SwiftData

@main
struct FriendsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
