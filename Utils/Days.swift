// Days.swift
// AoC
//
// Copyright (c) 2025 Paul Godavari. All rights reserved. 


import Foundation


typealias DayFunction = ([String]) -> PartResult


enum Part: String {
    case part1 = "Part 1"
    case part2 = "Part 2"
}


enum Type {
    case test
    case full
    case custom(String)
}


enum PartResult {
    case failure
    case numeric(Int64)
}


struct RunResult {
    var partResult: PartResult = .failure
    var time: TimeInterval = 0.0
}


struct Day {
    var number: Int
    var part: Part
    var type: Type
    var function: DayFunction
}


let days = [
    Day(number: 1, part: .part1, type: .test, function: Day_01_2024),
    Day(number: 1, part: .part1, type: .full, function: Day_01_2024),
    // Day(number: 1, part: .part1, type: .custom("Farkle"), function: Day_01_2024)
    // Day(number: 1, part: .part2, type: .test, function: Day_01_2024),
    // Day(number: 1, part: .part2, type: .full, function: Day_01_2024),
]
