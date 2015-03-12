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
    
    //Outlets
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!

    @IBOutlet weak var displayAge: UILabel!
    
    @IBOutlet weak var displayHeight: UILabel!
    
    @IBOutlet weak var displayWeight: UILabel!
    
    
    @IBOutlet weak var activityLevelSegmentedControl: UISegmentedControl!
    
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
    }

    @IBAction func genderChange(sender: AnyObject) {
        switch sender.selectedSegmentIndex {
        case 0:
            userGender = kUserGender.male
        default:
            userGender = kUserGender.female
        }
        println(userGender.rawValue)
    }
 
    @IBAction func ageChange(sender: UISlider) {
        userAge = Int(sender.value)
    }
    
    @IBAction func heightChange(sender: UISlider) {
        userHeight = Int(sender.value)
    }
    
    
    @IBAction func weightChange(sender: UISlider) {
        userWeight = Int(sender.value)
    }
    
    @IBAction func activityChange(sender: AnyObject) {
        switch sender.selectedSegmentIndex {
        case 0:
            userActivityLevel = kUserActivityLevel.sedentary
        case 1:
            userActivityLevel = kUserActivityLevel.lightlyActive
            
        case 3:
            userActivityLevel = kUserActivityLevel.extraActive
            
        default:
            userGender = kUserGender.female
        }
        println(userActivityLevel.rawValue)
    }
    
}

