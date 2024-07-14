//
//  Friend.swift
//  Friends
//
//  Created by Parth Antala on 2024-07-13.
//

import Foundation

struct Friend: Codable, Identifiable, Hashable {
    let id: UUID
    let name: String
}

struct User: Codable, Identifiable, Hashable {
    let id: UUID
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    var formattedDate: String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//        dateFormatter.timeStyle = .medium
//        let date = dateFormatter.string(from: registered)
//        return "\(date)"
        registered.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
