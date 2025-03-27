// main.swift
// AoC
//
// Copyright (c) 2025 Paul Godavari. All rights reserved. 
//
// This project depends on having the Input directory populated from:
// https://github.com/paulgodavari/AoC-Input, which is a private repo.
// It is considered bad for to share the Advent of Code input data
// and/or answers. You'll need to supply your own data to use this code.
//
// The Xcode scheme expects to have the run directory set to
// $(PROJECT_DIR)/Input for ease of opening input files.


import Foundation


func main() {
    for day in days {
        let result = runDayPart(day: day)
        if case let .numeric(value) = result.partResult {
            print("\(paddedDayNumber(day.number, separator: " ").capitalized) \(day.part.rawValue): \(value) in \(result.time) ms")
        }
    }
}


main()
