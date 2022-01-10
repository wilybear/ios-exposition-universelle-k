//
//  EntryData.swift
//  Expo1900
//
//  Created by kakao on 2022/01/10.
//

import Foundation

struct EntryData: Codable {
    var name: String
    var image: String
    var shortDescription: String
    var detailDescription: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case image = "image_name"
        case shortDescription = "short_desc"
        case detailDescription = "desc"
    }
}
