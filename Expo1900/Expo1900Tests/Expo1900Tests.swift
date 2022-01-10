//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by Jinwook Huh on 2022/01/10.
//

import XCTest

class Expo1900Tests: XCTestCase {
    func test_번들의_json_데이터를_불러올수있다() {
        let jsonData: Data? = FileLoader.shared.readFile(fileName: "items", extensionType: "json")
        XCTAssertNotNil(jsonData)
    }
    
    func test_json_데이터를_객체로_파싱할_수_있다() {
        guard let jsonData: Data = FileLoader.shared.readFile(fileName: "exposition_universelle_1900", extensionType: "json") else {
            XCTFail("error")
            return
        }
        
        let model: Exposition? = JSONParser.shared.decode(Exposition.self, from: jsonData)
        
        XCTAssertNotNil(model)
    }
}
