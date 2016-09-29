//
//  ViewController.swift
//  BullsEye
//
//  Created by Josiah Mory on 9/28/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  var currentValue = 0
  var targetValue = 0
  var roundValue = 0
  var scoreValue = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startNewRound()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func showAlert() {
    let difference = abs(currentValue - targetValue)
    let points = 100 - difference
    var titleText = ""
    var score = 0
    
    if difference == 0 {
      titleText = "Perfect Hit!"
      score += 100
    } else if difference < 5 {
      titleText = "Close One!"
      score += 50
    } else if difference < 15 {
      titleText = "Not Bad..."
    } else {
      titleText = "Way off :( \nbetter luck next time!"
      score += -20
    }
    
    let message = "The target was: \(targetValue)" +
                  "\nYou hit: \(currentValue)" +
                  "\nYou scored \(points) points and \(score) bonus points"

    
    let alert = UIAlertController(title: titleText,
                                  message: message,
                                  preferredStyle: .alert)
    let action = UIAlertAction(title: "OK",
                               style: .default,
                               handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
    scoreValue += points + score
    startNewRound()

  }

  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  func startNewRound() {
    targetValue = 1 + Int(arc4random_uniform(100))
    roundValue += 1
    currentValue = 50
    slider.value = Float(currentValue)
    updateLabels()
  }
  func updateLabels () {
    targetLabel.text = String(targetValue)
    roundLabel.text = String(roundValue)
    scoreLabel.text = String(scoreValue)
  }
}

