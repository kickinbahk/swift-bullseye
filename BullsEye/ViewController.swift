import UIKit
import QuartzCore

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
    startNewGame()
    
    let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
    slider.setThumbImage(thumbImageNormal, for: .normal)
    
    let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
    slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
    
    let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    
    let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
    let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
    slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
    
    let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
    let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
    slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    
    
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
                               handler: { action in
                                            self.startNewRound()
                                        })
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    scoreValue += points + score

  }

  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  @IBAction func startOver () {
    startNewGame()
  
    let transition = CATransition()
    transition.type = kCATransition
    transition.duration = 1
    transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    view.layer.add(transition, forKey: nil)
  }
  
  func startNewGame() {
    scoreValue = 0
    roundValue = 0
    startNewRound()
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
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

