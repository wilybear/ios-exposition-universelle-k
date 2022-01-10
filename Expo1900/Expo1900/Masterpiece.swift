//
//  Masterpiece.swift
//  Expo1900
//
//  Created by kakao on 2022/01/10.
//

import Foundation

struct Masterpiece: Codable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
