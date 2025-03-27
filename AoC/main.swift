// main.swift
// AoC
//
// Copyright (c) 2025 Paul Godavari. All rights reserved. 


import Foundation


func RunDay(day: Day) -> RunResult {
    let fileName = fileNameFrom(day.number, day.type)    
    var result: RunResult = .failure
    
    do {
        let fileURL = URL(fileURLWithPath: fileName)
        let contents = try String(contentsOf: fileURL, encoding: .utf8)
        let lines = contents
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
        let (value, time) = measureTime {
            day.function(lines)
        }
        result = RunResult.success(value)
    } catch {
        print("Error loading input file '\(fileName)': \(error)")
    }
    
    return result
}


func main() {
    print("Aoc Start")
    
    for day in days {
        let result = RunDay(day: day)
        if case let .success(
        print("Day\(day.number) \(day.part.rawValue) \(result.value) in \(result.time) ms")
    }
    
    print("Aoc Stop")
}


main()
