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

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    struct DayResult {
        var day: Day
        var expected: Int64
    }
    
    func testAoCDays() {
        let testCases = [
            DayResult(day: days[0], expected: 11),
            DayResult(day: days[1], expected: 1830467)
        ]
        
        for test in testCases {
            
        }
    }

}
