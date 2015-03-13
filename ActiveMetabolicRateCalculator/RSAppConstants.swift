//
//  RSAppConstants.swift
//  ActiveMetabolicRateCalculator
//
//  Created by Rachel Stevenson on 3/10/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import Foundation
import UIKit

//MARK: APPLICATION

let kAppTitle = "Active Metabolic Rate Calculator"
let kTitleFontName = "HelveticaNeue-Thin"
let kTitleFontSize:CGFloat = 20
let kBackgroundColor = UIColor(red: 0.362, green: 0, blue: 0.275, alpha: 1)

//MARK: USER

enum kUserGender: String {
    case
    male = "Male",
    female = "Female"
}

let kUserDefaultAge = 30

let kUserDefaultHeight = 72

let kUserDefaultWeight = 120

enum kUserActivityLevel: String {
    case
    sedentary = "Sedentary",
    light = "Light",
    very = "Very",
    extra = "Extra"
}

let kUserDefaultActiveMetabolicRate:Float = 2100
