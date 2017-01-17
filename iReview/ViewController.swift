//
//  ViewController.swift
//  iReview
//
//  Created by Samuel MCDONALD on 1/14/17.
//  Copyright © 2017 Samuel MCDONALD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    
    
    @IBOutlet var userFirstNameTextField :UITextField!
    @IBOutlet var reviewTextView         :UITextView!
    @IBOutlet var keeperSwitch           :UISwitch!
    @IBOutlet var keeperLabel            :UILabel!
    @IBOutlet var FoodRatingStepper      :UIStepper!
    @IBOutlet var FoodRatingLabel        :UILabel!
    @IBOutlet var serviceSegCon          :UISegmentedControl!
    @IBOutlet var overallSlider          :UISlider!
    @IBOutlet var overallSliderLabel     :UILabel!
    
    //MARK: - my Variables
    
    var myName:String = " "
    var myReview:String = " Review: "

    var myOverall = 5
    var myFoodRating = 5
    var myServiceRating = 2
    var myServiceRatingString = "✯✯✯"
    var myRecommend = true
    var myRecommendString = "Reccomendation: Keeper!"

    

    //MARK: - Interactivity Methods
 
    
    @IBAction func valueChanged(keeperSwitch: UISwitch) {
        if keeperSwitch.isOn {
            
            myRecommend = true
            myRecommendString   = "Keeper!"
            keeperLabel.textColor = UIColor.green
           
        }else {
            
            myRecommend = false
            myRecommendString   = "NOPE!"
            keeperLabel.textColor = UIColor.red
        }
        keeperLabel.text = myRecommendString
        print("Recommendation: \(myRecommendString)")    }
    
    @IBAction func valueChange(segControl :UISegmentedControl) {
        
        let name:String = segControl.titleForSegment(at: segControl.selectedSegmentIndex)!
        myServiceRating = segControl.selectedSegmentIndex
        myServiceRatingString = name
        print("Seg \(myServiceRatingString)")
        //PINWHEEL STAR
        //Unicode: U+272F, UTF-8: E2 9C AF
    }
    
    @IBAction func valueChanged(stepper: UIStepper) {
        
        let boo = "Food:  \(Int(stepper.value))/10"
        FoodRatingLabel.text = boo
        myFoodRating = (Int(stepper.value))
        print (myFoodRating)

    }
    
    @IBAction func valueChanged(slider: UISlider) {
        myOverall = (Int(slider.value*10))
        let temp = "Overall Rating: \(myOverall)/10"
        overallSliderLabel.text = temp
        print("Slider: \(myOverall)")
        
    }
    
    @IBAction func valueChanged(Button: UIButton) {
        if Button.currentTitle == "Submit Review"{
        //print (system("clear"))
        print ("\n\n\nRestaurant review for Blech!")
        print ("from \(myName)\n")
        print ("\(myReview)\n")
        print ("Service rated (segmented control) "+myServiceRatingString)
        print ("Food rated (stepper) \(myFoodRating)")
        print ("Overall rated (slider) \(myOverall)")
            print ("\(myRecommendString)")
        }
        else {
            reviewTextView.resignFirstResponder();
        }
    }
 
    
    //MARK: - TextField Delegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        guard let name = userFirstNameTextField.text
         else {
            textField.resignFirstResponder()
            myName = ""
            return false
        }
        textField.resignFirstResponder()
        myName = name
        print ("\(myName)")
        
        
        return true
    }
    
//MARK: - TextView Delegate Methods
    
    
    func textViewDidChange(_ textView: UITextView) {
        myReview = textView.text
        print(myReview);
    }
    
    /*
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
    }*/
    
//MARK: - Life Cycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewTextView.delegate         = self
        userFirstNameTextField.delegate = self
        reviewTextView.text          = myReview
        keeperSwitch.isOn            = myRecommend
        FoodRatingStepper.value      = Double(myFoodRating)
        overallSlider.value          = Float(myOverall)/10.0
        serviceSegCon.selectedSegmentIndex = myServiceRating
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

