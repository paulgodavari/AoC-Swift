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


func measurePartTime(_ operation: () -> PartResult) -> RunResult {
    let start = DispatchTime.now()
    
    let partResult = operation()
    
    let end = DispatchTime.now()
    let nanoseconds = end.uptimeNanoseconds - start.uptimeNanoseconds
    let milliseconds = Double(nanoseconds) / Double(NSEC_PER_MSEC)
    
    return RunResult(partResult: partResult, time: milliseconds)
}


func runDayPart(day: DayPart) -> RunResult {
    let fileName = fileNameFrom(day.number, day.type)
    var result = RunResult()
    
    do {
        let fileURL = URL(fileURLWithPath: fileName)
        let contents = try String(contentsOf: fileURL, encoding: .utf8)
        let lines = contents
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
        result = measurePartTime {
            day.function(lines)
        }
    } catch {
        print("Error loading input file '\(fileName)': \(error)")
    }
    
    return result
}


func main() {
    for day in days {
        let result = runDayPart(day: day)
        if case let .numeric(value) = result.partResult {
            print("\(paddedDayNumber(day.number, separator: " ").capitalized) \(day.part.rawValue): \(value) in \(result.time) ms")
        }
    }
}


main()
