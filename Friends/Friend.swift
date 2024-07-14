//
//  Friend.swift
//  Friends
//
//  Created by Parth Antala on 2024-07-13.
//

import Foundation

struct Friend: Codable, Identifiable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    var id: UUID
    var name: String
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }
        
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
        registered.formatted(date: .abbreviated, time: .omitted)
    }
}
