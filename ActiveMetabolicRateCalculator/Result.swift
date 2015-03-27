//
//  Result.swift
//  ActiveMetabolicRateCalculator
//
//  Created by Rachel Stevenson on 3/26/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import UIKit

class Result: NSObject {
    var date: String
    var weight: String
    var level: String
    var amr: Float
    
    init(date:String, weight:String, level:String, amr:Float) {
        self.date = date
        self.weight = weight
        self.level = level
        self.amr = amr
        super.init()
    }
   
}
