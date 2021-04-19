//
//  UserImage.swift
//  SocialKit
//
//  Created by Euler Carvalho on 19/04/21.
//

import Foundation

// MARK: - UserImage
struct UserImage: Codable, Identifiable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
