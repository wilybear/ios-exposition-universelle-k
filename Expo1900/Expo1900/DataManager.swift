//
//  DataManager.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import Foundation
import UIKit

class DataManager {
    static let shared = DataManager()
    
    private init() { }
    
    func getExposition() throws -> InternationalExposition {
        let jsonDecoder = JSONDecoder()
        guard let jsonData = NSDataAsset(name: "expo_1900")?.data else { fatalError("Json file doesn't exist") }
        let expositionModel = try jsonDecoder.decode(InternationalExposition.self, from: jsonData)
        return expositionModel
    }
    
    func getMasterpieces() throws -> [Masterpiece] {
        let jsonDecoder = JSONDecoder()
        guard let jsonData = NSDataAsset(name: "expo_1900_items")?.data else { fatalError("Json file doesn't exist") }
        let masterpieces = try jsonDecoder.decode([Masterpiece].self, from: jsonData)
        return masterpieces
    }
}
