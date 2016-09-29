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
  var currentValue: Int = 0
  var targetValue: Int = 0
  var roundValue: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startNewRound()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func showAlert() {
    var difference: Int = 0
    if currentValue > targetValue {
      difference = currentValue - targetValue
    } else if targetValue > currentValue {
      difference = targetValue - currentValue
    } else {
      difference = 0
    }
    let message = "The value of the slider is: \(currentValue)" +
                  "\nThe target value is: \(targetValue)" +
                  "\nThe difference is: \(difference)"
    let alert = UIAlertController(title: "Hello, World",
                                  message: message,
                                  preferredStyle: .alert)
    let action = UIAlertAction(title: "OK",
                               style: .default,
                               handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
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
  }
}

