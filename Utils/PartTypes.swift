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

