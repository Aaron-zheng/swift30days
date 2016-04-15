//
//  ViewController.swift
//  day10-videobackground
//
//  Created by Aaron on 14/4/16.
//  Copyright © 2016 sightcorner. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loginButton.layer.cornerRadius = 4
        registerButton.layer.cornerRadius = 4
        
        setupVideoBackground()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupVideoBackground() {
        
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("moments", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = ScalingMode.ResizeAspectFill
        alwaysRepeat = true
        sound = false
        startTime = 1.0
        alpha = 0.5
        contentURL = url
        
        view.userInteractionEnabled = true
    }

}

