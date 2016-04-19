//
//  HomeController.swift
//  day12-login
//
//  Created by Aaron on 18/4/16.
//  Copyright © 2016 sightcorner. All rights reserved.
//

import Foundation
import UIKit

class HomeController: UIViewController {
    
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
    }
}
