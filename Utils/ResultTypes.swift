// PartResult.swift
// AoC
//
// Copyright (c) 2025 Paul Godavari. All rights reserved. 


import Foundation


typealias DayFunction = ([String]) -> PartResult


enum PartResult {
    case failure
    case numeric(Int64)
}


struct RunResult {
    var partResult: PartResult = .failure
    var time: TimeInterval = 0.0
}


