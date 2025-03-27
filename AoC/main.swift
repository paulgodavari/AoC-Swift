// main.swift
// AoC
//
// Copyright (c) 2025 Paul Godavari. All rights reserved. 


import Foundation


func measureTime<T>(_ operation: () -> T) -> (result: T, durationMilliseconds: Double) {
    let start = DispatchTime.now()
    let result = operation()
    let end = DispatchTime.now()
    
    let nanoseconds = end.uptimeNanoseconds - start.uptimeNanoseconds
    let milliseconds = Double(nanoseconds) / Double(NSEC_PER_MSEC)
    
    return (result, milliseconds)
}


func fileNameFrom(_ dayNumber: Int, _ type: Type) -> String {
    let name = String(format: "day_%02d.", dayNumber)
    var suffix = ""
    switch type {
        case .test: suffix = "test_input"
        case .full: suffix = "input"
        case .custom(let s): suffix = "test_input_" + s
    }
    return name + suffix
}


func main() {
    print("Aoc Start")
    
    for day in days {
        let fileName = fileNameFrom(day.number, day.type)
        var lines = [String]()
        
        do {
            let fileURL = URL(fileURLWithPath: fileName)
            let contents = try String(contentsOf: fileURL, encoding: .utf8)
            lines = contents
                .components(separatedBy: .newlines)
                .filter { !$0.isEmpty }
        } catch {
            print("Error loading input file '\(fileName)': \(error)")
            continue
        }
        
        let (result, time) = measureTime {
            day.function(lines)
        }
        
        print("Day\(day.number) \(day.part.rawValue) \(result.value) in \(time) ms")
    }
    
    print("Aoc Stop")
}


main()
