//
//  ViewController.swift
//  day12-login
//
//  Created by Aaron on 18/4/16.
//  Copyright © 2016 sightcorner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var layoutCons: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        username.layer.cornerRadius = 5
        submitButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
     
        layoutCons.constant -= view.bounds.width
        submitButton.alpha = 0
    }
    

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5, delay: 0.1, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.layoutCons.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            },
            completion: nil
        )
        
        UIView.animateWithDuration(0.5, delay: 0.2, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.submitButton.alpha = 1
            }, completion: nil)
    }
}

