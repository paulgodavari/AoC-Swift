// Day01.swift
// AoC
//
// Copyright (c) 2025 Paul Godavari. All rights reserved. 


import Foundation


enum InputError: Error {
    case lineFormat(value: String, line: Int)
    case lengthMismatch
}


func ParseInput(_ lines: [String]) throws -> ([Int64], [Int64]) {
    var leftList = [Int64]()
    var rightList = [Int64]()
    var lineNumber = 0
    
    for line in lines {
        lineNumber += 1
        let parts = line
                        .components(separatedBy: .whitespaces)
                        .filter { !$0.isEmpty }
                        .compactMap { Int64($0) }
        guard parts.count == 2 else {
            throw InputError.lineFormat(value: line, line: lineNumber)
        }
        leftList.append(parts[0])
        rightList.append(parts[1])
    }
    
    return (leftList, rightList)
}


// The following condition must be true to call this method: left.count == right.count
func ComputeDistance(_ left: [Int64], _ right: [Int64], _ part: ProblemPart) throws -> Int64 {
    guard left.count == right.count else {
        throw InputError.lengthMismatch
    }
    
    var distance: Int64 = 0
    
    if part == .part1 {
        for index in 0..<left.count {
            let current = Int64(abs(left[index] - right[index]))
            distance += current
        }
    } else {
        var counts = [Int64: Int64]()
        for value in right {
            counts.updateValue((counts[value] ?? 0) + 1, forKey: value)
        }
        for value in left {
            distance += (counts[value] ?? 0) * value
        }
    }
    
    return distance
}


func Day_01_2024(_ inputFileLines: [String], problemPart: ProblemPart) -> PartResult {
    var result: PartResult = .failure
    
    do {
        var (leftList, rightList) = try ParseInput(inputFileLines)
        leftList.sort()
        rightList.sort()
        let distance: Int64 = try ComputeDistance(leftList, rightList, problemPart)
        result = .numeric(distance)
    } catch InputError.lineFormat(let value, let line) {
        print("Invalid input at line \(line): '\(value)'")
    } catch InputError.lengthMismatch {
        print("Length mismatch")
    } catch {
        print("Other error: \(error)")
    }
    
    return result
}
