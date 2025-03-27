// Utils.swift
// AoC
//
// Copyright (c) 2025 Paul Godavari. All rights reserved. 


import Foundation


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


