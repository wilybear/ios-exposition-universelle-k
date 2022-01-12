//
//  DataManager.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

class JsonParser {
    static let shared = JsonParser()
    
    private let jsonDecoder = JSONDecoder()
    
    private init() { }
    
    func getExposition() throws -> InternationalExposition {
        guard let jsonData = NSDataAsset(name: "expo_1900")?.data else { fatalError("Json file doesn't exist") }
        let expositionModel = try jsonDecoder.decode(InternationalExposition.self, from: jsonData)
        return expositionModel
    }
    
    func getHeritages() throws -> [Heritage] {
        guard let jsonData = NSDataAsset(name: "expo_1900_items")?.data else { fatalError("Json file doesn't exist") }
        let heritages = try jsonDecoder.decode([Heritage].self, from: jsonData)
        return heritages
    }
}
