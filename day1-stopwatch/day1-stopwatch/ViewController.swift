//
//  ViewController.swift
//  day1-stopwatch
//
//  Created by Aaron on 4/4/16.
//  Copyright (c) 2016 sightcorner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.enabled = false
        timeLabel.text = counter.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var counter = 0.0
    var timer = NSTimer()
    var isPlaying = false

    @IBOutlet weak var stopButton: UIButton!

    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func stopButtonTouch(sender: UIButton) {
        playButton.enabled = true
        stopButton.enabled = false
        timer.invalidate()
        isPlaying = false
    }
    
    @IBAction func playButtonTouch(sender: UIButton) {
        if isPlaying {
            return
        }
        
        playButton.enabled = false
        stopButton.enabled = true
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
        
        isPlaying = true
    }
    
    @IBAction func resetButtonTouch(sender: UIButton) {
        playButton.enabled = true
        stopButton.enabled = false
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timeLabel.text = counter.description
    }
    
    func updateTimer() {
        self.counter = counter + 0.10
        timeLabel.text = String(format: "%.1f", counter)
    }
    
    
}

