//
//  ViewController.swift
//  Bullseye
//
//  Created by Dawid Nadolski on 31/03/2020.
//  Copyright © 2020 Dawid Nadolski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetScoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var targetValue: Int = Int.random(in: 1...100)
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGame()
        updateLabels()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlited = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlited, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    func newRound() {
        round += 1
        slider.value = 50.0
        targetValue = Int.random(in: 1...100)
        updateLabels()
    }
    
    @IBAction func newGame() {
        score = 0
        round = 0
        newRound()
    }
    
    @IBAction func showAlert() {
        let value = Int(slider.value.rounded())
        let difference = abs(targetValue - value)
        var points = 100 - difference
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference <= 10 {
            title = "You almost had it!"
        } else if difference <= 20 {
            title = "Not great not terrible!"
        } else {
            title = "Not even close!"
        }
        
        let message = "You hit \(value)\n The target was \(targetValue) \n You receive \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Next round", style: .default, handler: {
            action in
            self.newRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        score += points
        }
    
    func updateLabels() {
        targetScoreLabel.text = "\(targetValue)"
        scoreLabel.text = "Score: \(score)"
        roundLabel.text = "Round: \(round)"
    }
}
