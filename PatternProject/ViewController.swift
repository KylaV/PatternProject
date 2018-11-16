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

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var patternLabel: UILabel!
    
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
            }
            else {
                print("Red Button Released")
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
            }
            else {
                print("Green Button Released")
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
            
            //Chech Buttons
            for i in 0..<buttonArray.count{
                try buttonArray[i].setDeviceSerialNumber(528057)
                try buttonArray[i].setHubPort(i + 2)
                try buttonArray[i].setIsHubPortDevice(true)
                let _ = buttonArray[i].attach.addHandler(attach_handler)
                try buttonArray[i].open()
            }

            for i in 0..<ledArray.count{
                try ledArray[i].setDeviceSerialNumber(528057)
                try ledArray[i].setHubPort(i)
                try ledArray[i].setIsHubPortDevice(true)
                let _ = ledArray[i].attach.addHandler(attach_handler)
                try ledArray[i].open()
            }
            
            let _ = buttonArray[0].stateChange.addHandler(state_changeRed)
            let _ = buttonArray[1].stateChange.addHandler(state_changeGreen)
            
        } catch let err as PhidgetError {
            print("Phidget Error" + err.description)
        } catch {
            //catch other errors here
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}

