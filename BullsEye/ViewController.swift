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
  var currentValue: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    currentValue = lroundf(slider.value)
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func showAlert() {
    let message = "The value of the slider is: \(currentValue)"
    let alert = UIAlertController(title: "Hello, World",
                                  message: message,
                                  preferredStyle: .alert)
    let action = UIAlertAction(title: "OK",
                               style: .default,
                               handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }

  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
}
