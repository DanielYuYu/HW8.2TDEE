//
//  ViewController.swift
//  HW8.2TDEE
//
//  Created by Daniel on 2018/7/24.
//  Copyright © 2018年 Daniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var myGender: UISegmentedControl!
    @IBOutlet weak var myAge: UITextField!
    @IBOutlet weak var myCm: UITextField!
    @IBOutlet weak var myKg: UITextField!
    @IBOutlet weak var myWorkoutDay: UISlider!
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var sliderTextView: UITextView!
    
    @IBAction func slider(_ sender: UISlider) {
        sliderTextView.text = "\(String(format: "%0.f", sender.value))"
    }
    @IBAction func commitButton(_ sender: Any) {
        let age = Int(myAge.text!)
        let cm = Int(myCm.text!)
        let kg = Int(myKg.text!)
        var genderStatus = Int()
        var active = Double()
        if myGender.selectedSegmentIndex == 0 {
            genderStatus = 5
        }
        else{
            genderStatus = -161
        }
       
        switch Int(myWorkoutDay.value){
        case 0:
            active = 1.2
        case 1,2:
            active = 1.375
        case 3,4,5:
            active = 1.55
        case 6,7:
            active = 1.725
        case 8:
            active = 1.9
        default:
            break
        }
       
        if let age = age ,let cm = cm, let kg = kg{
            
            let bmr = (Double(10 * kg) + (Double(cm) * 6.25) - Double(5 * age) - Double(genderStatus))
            let total = bmr * active
            let bmi = String(format:"%.2f",Double(kg)/(Double(cm)*Double(
                cm)/10000))
            
            var result = ""
            if Double(kg/(cm*cm/10000)) < 18.5 {
                result = ("體重過輕")
            }
            else if (Double(kg/(cm*cm/10000)) >= 18.5) && (kg/(cm*cm/10000) <= 24) {
                 result = ("正常範圍")
            }
            else {
                result = ("屬於肥胖")
            }
            outputTextView.text = ("基礎代謝率為:\(Int(bmr))\n每日總消耗熱量(TDEE)為:\(Int(total))\nBMI值為\(bmi) 屬於:\(result)")
            view.endEditing(true)
        }
    }
}

