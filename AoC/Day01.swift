// Day01.swift
// AoC
//
// Copyright (c) 2025 Paul Godavari. All rights reserved. 


import Foundation


enum InputError: Error {
    case lineFormat(value: String, line: Int)
    case lengthMismatch
}


func ParseInput(_ lines: [String]) throws -> ([Int], [Int]) {
    var leftList = [Int]()
    var rightList = [Int]()
    var lineNumber = 0
    
    for line in lines {
        lineNumber += 1
        let parts = line
                        .components(separatedBy: .whitespaces)
                        .filter { !$0.isEmpty }
                        .compactMap { Int($0) }
        guard parts.count == 2 else {
            throw InputError.lineFormat(value: line, line: lineNumber)
        }
        leftList.append(parts[0])
        rightList.append(parts[1])
    }
    
    return (leftList, rightList)
}


// The following condition must be true to call this method: left.count == right.count
func ComputeDistance(_ left: [Int], _ right: [Int]) throws -> Int64 {
    guard left.count == right.count else {
        throw InputError.lengthMismatch
    }
    
    var distance: Int64 = 0
    
    for index in 0..<left.count {
        let current = Int64(abs(left[index] - right[index]))
        distance += current
    }
    
    return distance
}


func Day_01_2024(_ inputFileLines: [String]) -> Result {
    var result = Result()
    
    do {
        var (leftList, rightList) = try ParseInput(inputFileLines)
        leftList.sort()
        rightList.sort()
        result.value = try ComputeDistance(leftList, rightList)
    } catch InputError.lineFormat(let value, let line) {
        print("Invalid input at line \(line): '\(value)'")
    } catch InputError.lengthMismatch {
        print("Length mismatch")
    } catch {
        print("Other error: \(error)")
    }
    
    return result
}
