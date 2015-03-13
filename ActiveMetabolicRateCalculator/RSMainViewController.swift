//
//  ViewController.swift
//  ActiveMetabolicRateCalculator
//
//  Created by Rachel Stevenson on 3/7/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import UIKit

class RSMainViewController: UIViewController {
    
    //Data Variables
    
    var userGender = kUserGender.female
    var userAge:Int = kUserDefaultAge {
        didSet{
            displayAge.text = "Age: \(userAge) years"
        }
    }
    var userHeight:Int = kUserDefaultHeight {
        didSet{
            displayHeight.text = "Height: \(userHeight) inches"
        }
    }
    var userWeight:Int = kUserDefaultWeight {
        didSet{
            displayWeight.text = "Weight: \(userWeight) pounds"
        }
    }
    var userActivityLevel = kUserActivityLevel.sedentary
    var userActiveMetabolicRate:Float = kUserDefaultActiveMetabolicRate {
    didSet{
        displayActiveMetabolicRate.text = "\(userActiveMetabolicRate)"
        }
    }
    
    //Outlets
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!

    @IBOutlet weak var displayAge: UILabel!
    
    @IBOutlet weak var displayHeight: UILabel!
    
    @IBOutlet weak var displayWeight: UILabel!
    
    @IBOutlet weak var activityLevelSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var displayActiveMetabolicRate: UILabel!
    
    
    //Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = kAppTitle
        view.backgroundColor = kBackgroundColor
        genderSegmentedControl.selectedSegmentIndex = 1
        activityLevelSegmentedControl.selectedSegmentIndex = 2
        displayAge.text = "Age: \(userAge) years"
        displayHeight.text = "Height: \(userHeight) inches"
        displayWeight.text = "Weight: \(userWeight) pounds"
        displayActiveMetabolicRate.text = " \(userActiveMetabolicRate)"
    }

    @IBAction func genderChange(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            userGender = kUserGender.male
        default:
            userGender = kUserGender.female
        }
        println(userGender.rawValue)
        println(calculateActiveMetabolicRate())        
    }
 
    @IBAction func ageChange(sender: UISlider) {
        userAge = Int(sender.value)
        println(calculateActiveMetabolicRate())
    }
    
    @IBAction func heightChange(sender: UISlider) {
        userHeight = Int(sender.value)
        println(calculateActiveMetabolicRate())
    }
    
    
    @IBAction func weightChange(sender: UISlider) {
        userWeight = Int(sender.value)
        println(calculateActiveMetabolicRate())
    }
    
    @IBAction func activityChange(sender: AnyObject) {
        switch sender.selectedSegmentIndex {
        case 0:
            userActivityLevel = kUserActivityLevel.sedentary
        case 1:
            userActivityLevel = kUserActivityLevel.light
        case 2:
            userActivityLevel = kUserActivityLevel.very
        case 3:
            userActivityLevel = kUserActivityLevel.extra
        default:
            userGender = kUserGender.female
        }
        println(userActivityLevel.rawValue)
        println(calculateActiveMetabolicRate())
    }
 
    func calculateBasalMetabolicRate() -> Float {
        let maleWeightConstant:Float = 6.23
        let maleHeightConstant:Float = 12.7
        let maleAgeConstant:Float = 6.8
        let maleCalcConstant:Float = 66
        
        let femaleWeightConstant:Float = 4.35
        let femaleHeightConstant:Float = 4.7
        let femaleAgeConstant:Float = 4.7
        let femaleCalcConstant:Float = 655
        
        var weightCalc = Float()
        var heightCalc = Float()
        var ageCalc = Float()
        
        if userGender == kUserGender.male {
            weightCalc = maleWeightConstant * Float(userWeight)
            heightCalc = maleHeightConstant * Float(userHeight)
            ageCalc = maleAgeConstant * Float(userAge)
            return (maleCalcConstant + weightCalc + heightCalc - ageCalc)
        }
        else {
            weightCalc = (femaleWeightConstant * Float(userWeight))
            heightCalc = (femaleHeightConstant * Float(userHeight))
            ageCalc = (femaleAgeConstant * Float(userAge))
            return (femaleCalcConstant + weightCalc + heightCalc - ageCalc)
        }
    }
    
    func calculateActiveMetabolicRate() {
        let sedentaryConstant:Float = 1.2
        let lightConstant:Float = 1.375
        let veryConstant:Float = 1.725
        let extraConstant:Float = 1.9
        
        switch userActivityLevel
        {
        case .sedentary:
            userActiveMetabolicRate = calculateBasalMetabolicRate() * sedentaryConstant
        case .light:
            userActiveMetabolicRate = calculateBasalMetabolicRate() * lightConstant
        case .very:
            userActiveMetabolicRate = calculateBasalMetabolicRate() * veryConstant
        case .extra:
            userActiveMetabolicRate = calculateBasalMetabolicRate() * extraConstant
    }
  }
}
