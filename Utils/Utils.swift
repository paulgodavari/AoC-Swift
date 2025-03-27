// Utils.swift
// AoC
//
// Copyright (c) 2025 Paul Godavari. All rights reserved. 


import Foundation


func paddedDayNumber(_ dayNumber: Int, separator: String = "_") -> String {
    String(format: "day\(separator)%02d", dayNumber)
}


func fileNameFrom(_ dayNumber: Int, _ type: InputType) -> String {
    let name = paddedDayNumber(dayNumber)
    var suffix = ""
    switch type {
        case .test: suffix = "test_input"
        case .full: suffix = "input"
        case .custom(let s): suffix = "test_input_" + s
    }
    return name + "." + suffix
}


