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
    if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
      if let htmlData = try? Data(contentsOf: url) {
        let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
        webView.load(htmlData, mimeType: "text/html",
                     textEncodingName: "UTF-8", baseURL: baseURL)
      }
    }
      // Do any additional setup after loading the view.
  }

  @IBOutlet weak var webView: UIWebView!
  
  @IBAction func close() {
    dismiss(animated: true, completion: nil)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
