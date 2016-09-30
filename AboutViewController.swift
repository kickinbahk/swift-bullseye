//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Josiah Mory on 9/29/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

  override func viewDidLoad() {
      super.viewDidLoad()

      // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  @IBAction func close() {
    dismiss(animated: true, completion: nil)
  }
  

}
