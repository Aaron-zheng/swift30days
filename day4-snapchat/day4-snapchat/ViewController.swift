//
//  ViewController.swift
//  day4-snapchat
//
//  Created by Aaron on 7/4/16.
//  Copyright (c) 2016 sightcorner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UIApplication.sharedApplication().statusBarHidden = true
        let rightView: RightView = RightView(nibName: "RightView", bundle: nil)
        let cameraView: CameraView = CameraView(nibName: "CameraView", bundle: nil)
        
        self.addChildViewController(rightView)
        self.scrollView.addSubview(rightView.view)
        rightView.didMoveToParentViewController(self)
        
        self.addChildViewController(cameraView)
        self.scrollView.addSubview(cameraView.view)
        cameraView.didMoveToParentViewController(self)
        
        var cameraViewFrame: CGRect = cameraView.view.frame
        cameraViewFrame.origin.x = self.view.frame.width
        cameraView.view.frame = cameraViewFrame
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width * 2, self.view.frame.height)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var scrollView: UIScrollView!

}

