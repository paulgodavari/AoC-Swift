// main.swift
// AoC
//
// Copyright (c) 2025 Paul Godavari. All rights reserved. 


import Foundation


func measureTime(_ operation: () -> PartResult) -> RunResult {
    let start = DispatchTime.now()
    
    let partResult = operation()
    
    let end = DispatchTime.now()
    let nanoseconds = end.uptimeNanoseconds - start.uptimeNanoseconds
    let milliseconds = Double(nanoseconds) / Double(NSEC_PER_MSEC)
    
    return RunResult(partResult: partResult, time: milliseconds)
}


func runDay(day: Day) -> RunResult {
    let fileName = fileNameFrom(day.number, day.type)
    var result = RunResult()
    
    do {
        let fileURL = URL(fileURLWithPath: fileName)
        let contents = try String(contentsOf: fileURL, encoding: .utf8)
        let lines = contents
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
        result = measureTime {
            day.function(lines)
        }
    } catch {
        print("Error loading input file '\(fileName)': \(error)")
    }
    
    return result
}


func main() {
    print("Aoc Start")
    
    for day in days {
        let result = runDay(day: day)
        if case let .numeric(value) = result.partResult {
            print("Day\(day.number) \(day.part.rawValue) \(value) in \(result.time) ms")
        }
    }
    
    print("Aoc Stop")
}


main()
