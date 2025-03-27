// AoC_Tests.swift
// AoC-Tests
//
// Copyright (c) 2025 Paul Godavari. All rights reserved. 


import XCTest


final class AoC_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAoCDays() {
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.resourcePath else {
            XCTFail("Could not find resource path in test bundle")
            return
        }
        let directoryUrl = URL(fileURLWithPath: path)
        
        for day in days {
            let result = runTest(day: day, directory: directoryUrl)
            
            switch result {
                case .failure:
                    XCTFail("\(paddedDayNumber(day.number).capitalized) \(day.part.rawValue) failed")
                case .numeric(let value):
                    XCTAssert(value == day.expectedResult)
                    print("  + \(paddedDayNumber(day.number, separator: " ").capitalized) \(day.part.rawValue) (\(day.type)) = \(value) expected: \(day.expectedResult)")
            }
        }
    }

}
