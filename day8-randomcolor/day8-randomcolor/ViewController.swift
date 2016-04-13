//
//  ViewController.swift
//  day8-randomcolor
//
//  Created by Aaron on 12/4/16.
//  Copyright (c) 2016 sightcorner. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonDidTouch(sender: UIButton) {
        
        let bgMusic = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ecstasy", ofType: "mp3")!)
        
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        
        audioPlayer = AVAudioPlayer(contentsOfURL: bgMusic, error: nil)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "randomColor", userInfo: nil, repeats: true)
        
    }
    
    func randomColor() {
        let red = CGFloat(drand48())
        let blue = CGFloat(drand48())
        let green = CGFloat(drand48())
        self.view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }

}

