//
//  ViewController.swift
//  PatternProject
//
//  Created by Kyla Vidallo on 2018-11-15.
//  Copyright © 2018 Kyla Vidallo. All rights reserved.
//

import UIKit
import Phidget22Swift

class ViewController: UIViewController {
    
    let buttonArray = [DigitalInput(), DigitalInput()]
    let ledArray = [DigitalOutput(), DigitalOutput()]
    let patternNumber : Int = 0
    var playerAnswer1 : Bool = false
    var playerAnswer2 : Bool = false
    var playerAnswer3 : Bool = false
    var playerAnswer4 : Bool = false

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var patternLabel: UILabel!
    
    let allPatterns = PatternBank()
    
    func attach_handler(sender: Phidget) {
        do {
            let hubPort = try sender.getHubPort()
            
            if (hubPort == 0){
                print("Red Button Attached")
            }
            else if (hubPort == 1) {
                print("Green Button Attached")
            }
            else if (hubPort == 2) {
                print("Red LED Attached")
            }
            else {
                print("Green LED Attached")
            }
            
        } catch let err as PhidgetError {
            print("Phidget Error" + err.description)
        } catch {
            //catch other errors here
        }
    }
   
    func state_changeRed (sender: DigitalInput, state: Bool) {
        do {
            if (state == true){
                print("Red Button Pressed")
                try ledArray[0].setState(true)
                playerAnswer1 = false
                playerAnswer2 = false
                playerAnswer3 = false
                playerAnswer4 = false
                check1()
                check2()
                check3()
                check4()
            }
            else {
                try ledArray[0].setState(false)
            }
       
        } catch let err as PhidgetError {
            print("Phidget Error" + err.description)
        } catch {
            //catch other errors here
        }
    }
    
    func state_changeGreen (sender: DigitalInput, state: Bool) {
        do {
            if (state == true){
                print("Green Button Pressed")
                try ledArray[1].setState(true)
                playerAnswer1 = true
                playerAnswer2 = true
                playerAnswer3 = true
                playerAnswer4 = true
                check1()
                check2()
                check3()
                check4()
            }
            else {
                try ledArray[1].setState(false)
            }
            
       
        } catch let err as PhidgetError {
            print("Phidget Error" + err.description)
        } catch {
            //catch other errors here
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
           
            try Net.enableServerDiscovery(serverType: .deviceRemote)
            //Checks LEDs
            for i in 0..<ledArray.count{
                try ledArray[i].setDeviceSerialNumber(528057)
                try ledArray[i].setHubPort(i + 2)
                try ledArray[i].setIsHubPortDevice(true)
                let _ = ledArray[i].attach.addHandler(attach_handler)
                try ledArray[i].open()
            }
            
            //Chech Buttons
            for i in 0..<buttonArray.count{
                try buttonArray[i].setDeviceSerialNumber(528057)
                try buttonArray[i].setHubPort(i)
                try buttonArray[i].setIsHubPortDevice(true)
                let _ = buttonArray[i].attach.addHandler(attach_handler)
                try buttonArray[i].open()
            }
            //State Change of Buttons
            let _ = buttonArray[0].stateChange.addHandler(state_changeRed)
            let _ = buttonArray[1].stateChange.addHandler(state_changeGreen)
            
        } catch let err as PhidgetError {
            print("Phidget Error" + err.description)
        } catch {
            //catch other errors here
        }
        
        let firstPattern = allPatterns.list[0]
        patternLabel.text = firstPattern.colorSequence
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Patterns
    func nextPattern () {
        if patternNumber <= 3{
            patternLabel.text = allPatterns.list[patternNumber].colorSequence
        }
    }
    
    func check1() {
     
        let correct1 = allPatterns.list[patternNumber].answer1
        
        if (playerAnswer1 == correct1) {
            print("1 Correct!")
        }
        else {
            print("1 Wrong!")
            }
    }
    
    func check2() {
        let correct2 = allPatterns.list[patternNumber].answer2
        
        if (playerAnswer2 == correct2) {
            print("2 Correct")
        }
        else {
            print("2 Wrong")
        }
    }
    
    func check3() {
        let correct3 = allPatterns.list[patternNumber].answer3
        
        if (playerAnswer3 == correct3) {
            print("3 Correct")
        }
        else {
            print("3 Wrong")
        }
    }
    
    func check4() {
        let correct4 = allPatterns.list[patternNumber].answer4
        
        if (playerAnswer4 == correct4) {
            print("4 Correct")
        }
        else {
            print("4 Wrong")
        }
    }
    
}
