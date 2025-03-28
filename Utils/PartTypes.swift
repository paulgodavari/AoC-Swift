// Days.swift
// AoC
//
// Copyright (c) 2025 Paul Godavari. All rights reserved. 


import Foundation


typealias DayFunction = ([String], ProblemPart) -> PartResult


enum ProblemPart: String {
    case part1 = "Part 1"
    case part2 = "Part 2"
}


enum InputType: Hashable {
    case test
    case full
    case custom(String)
}


struct DayPart {
    var number: Int
    var part: ProblemPart
    var type: InputType
    var function: DayFunction
    var expectedResult: Int64
}


//let days = [
//    DayPart(number: 1, part: .part1, type: .test, function: Day_01_2024, expectedResult: 11),
//    DayPart(number: 1, part: .part1, type: .full, function: Day_01_2024, expectedResult: 1830467),
//    
//    // Day(number: 1, part: .part1, type: .custom("Farkle"), function: Day_01_2024)
//    // Day(number: 1, part: .part2, type: .test, function: Day_01_2024),
//    // Day(number: 1, part: .part2, type: .full, function: Day_01_2024),
//]
