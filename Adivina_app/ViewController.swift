//
//  ViewController.swift
//  Adivina_app
//
//  Created by Elisabet on 22/10/15.
//  Copyright © 2015 Elisabet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var attemps: Int = 0
    var randNumber: Int = generateNum(1, 1000)
    var minimumValue: Int = 1
    var maximumValue: Int = 1000
    
    @IBOutlet weak var attemptsLbl: UILabel!
    
    @IBOutlet weak var displayLbl: UILabel!
    
    @IBOutlet weak var currentValueLbl: UILabel!
    
    @IBOutlet weak var minValueLbl: UILabel!
    
    @IBOutlet weak var maxValueLbl: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var playBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayMessage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func slider(sender: UISlider) {
        currentValueLbl.text = "\(Int(slider.value))"
    }
    
    @IBAction func playBtn(sender: UIButton) {
        let currentValue: Int = Int(slider.value)
        attemps++
        attemptsLbl.text = "\(attemps) intentos"
        guess(currentValue)
    }

    @IBAction func replayBtn(sender: UIButton) {
        resetGame()
    }
    
    func displayMessage () {
        displayLbl.text = "Adivina un número del \(minimumValue)-\(maximumValue)"
    }
    
    func guess(num: Int) {
        if(attemps < 12) {
            if(num == randNumber) {
                displayLbl.text = "Felicidades, ganaste en \(attemps) intentos!"
                displayLbl.textColor = UIColor.greenColor()
                slider.enabled = false
                playBtn.enabled = false
            }
            else if (num < randNumber) {
                minimumValue = num
                slider.minimumValue = Float(minimumValue)
                minValueLbl.text = "\(minimumValue)"
                displayMessage()
            }
            else {
                maximumValue = num
                slider.maximumValue = Float(maximumValue)
                maxValueLbl.text = "\(maximumValue)"
                displayMessage()
            }
        }
        else {
            displayLbl.text = "Lástima, el número era \(randNumber)"
            displayLbl.textColor = UIColor.redColor()
            slider.enabled = false
            playBtn.enabled = false
        }
    }
    
    func resetGame() {
        randNumber = generateNum(1,1000)
        attemps = 0
        attemptsLbl.text = "\(attemps) intentos"
        minimumValue = 1
        maximumValue = 1000
        slider.minimumValue = Float(minimumValue)
        minValueLbl.text = "\(minimumValue)"
        slider.maximumValue = Float(maximumValue)
        maxValueLbl.text = "\(maximumValue)"
        slider.value = 1
        currentValueLbl.text = "\(Int(slider.value))"
        slider.enabled = true
        playBtn.enabled = true
        displayLbl.textColor = UIColor.whiteColor()
        displayMessage()
    }

}

