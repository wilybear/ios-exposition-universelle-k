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
    
    func fetchData<T: Codable>(from fileName: JsonFileList) throws -> T{
        guard let jsonData = NSDataAsset(name: fileName.rawValue)?.data else { fatalError("Json file doesn't exist") }
        let data = try jsonDecoder.decode(T.self, from: jsonData)
        return data
    }
    
    enum JsonFileList: String{
        case expo1900 = "expo_1900"
        case expo1900Items = "expo_1900_items"
    }
}


