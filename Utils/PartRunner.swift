// PartRunner.swift
// AoC
//
// Copyright (c) 2025 Paul Godavari. All rights reserved. 



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
    let fileURL = URL(fileURLWithPath: fileName)
    var result = RunResult()
    
    do {
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


func runTest(day: DayPart, directory: URL) -> PartResult {
    let fileName = fileNameFrom(day.number, day.type)
    let fileUrl = directory.appending(path: fileName)
    
    var result: PartResult = .failure
    
    do {
        let contents = try String(contentsOf: fileUrl, encoding: .utf8)
        let lines = contents
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
        result = day.function(lines)
    } catch {
        print("Error loading input file '\(fileName)': \(error)")
    }
    
    return result
}
