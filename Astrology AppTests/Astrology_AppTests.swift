//
//  Astrology_AppTests.swift
//  Astrology AppTests
//
//  Created by Maitree Bain on 7/5/21.
//

import XCTest
@testable import Astrology_App

class Astrology_AppTests: XCTestCase {

    func testGettingBackZodiac() {
        
        let sign = "Gemini"
        
        AstrologyAPIClient().getSign(for: sign) { (result) in
            
            switch result {
            case .success(let item):
                XCTAssertEqual(sign, item.sunsign, "it worked")
            case .failure(let error):
                print("could not access link: \(error)")
            }
        }
    
    }

}
