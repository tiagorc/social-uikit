//
//  Post.swift
//  SocialKit
//
//  Created by Euler Carvalho on 19/04/21.
//

import Foundation

// MARK: - Post
struct Post: Codable, Identifiable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
