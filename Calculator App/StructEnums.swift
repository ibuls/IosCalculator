//
//  StructEnums.swift
//  Calculator App
//
//  Created by Piyush Bulchandani on 26/01/20.
//  Copyright © 2020 Piyush Bulchandani. All rights reserved.
//

import Foundation


enum Operator: String {
    case add = "+"
    case subtract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState: String {
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
