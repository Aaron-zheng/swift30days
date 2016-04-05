//
//  ViewController.swift
//  day2-customfont
//
//  Created by Aaron on 5/4/16.
//  Copyright (c) 2016 sightcorner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var data = ["day2 custom font", "swift30days", "当下最流行三大病症：拖延症、强迫症、选择困难症，直白点说就是懒、贱、穷。", "阳光暖照，岁月静好，你还不来，我怎敢老去"];
    
    var fontNames = ["ArialHebrew-Bold", "Helvetica", "DINCondensed-Bold"]
    
    var fontRowIndex = 0
    @IBOutlet weak var changeButton: UIButton!
    
    @IBOutlet weak var fontTableView: UITableView!
    
    @IBAction func changeButtonDidTouch(sender: AnyObject) {
        
        fontRowIndex = (fontRowIndex + 1) % 3
        fontTableView.reloadData()
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontTableView.dataSource = self
        fontTableView.delegate = self
        
        for each in UIFont.familyNames() {
            for f in UIFont.fontNamesForFamilyName(each as String) {
                println(f)
            }
        }
        
        changeButton.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCellWithIdentifier("fontcell", forIndexPath: indexPath) as UITableViewCell
        let text = data[indexPath.row]
        cell.textLabel?.text = text
//        cell.textLabel?.textColor = UIColor.blueColor()
        cell.textLabel?.font = UIFont(name: self.fontNames[fontRowIndex], size: 16)
        return cell
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 50
//    }

}

