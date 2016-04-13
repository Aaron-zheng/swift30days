//
//  ViewController.swift
//  day7-pullinfo
//
//  Created by Aaron on 12/4/16.
//  Copyright (c) 2016 sightcorner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let emoji1 = ["🐔", "🐂", "🐑"]
    let emoji2 = ["🐶", "🐱", "🐭"]
    let cellIndentifer = "cellindentifier"
    
    var data = [String]()
    var tableViewController = UITableViewController(style: .Plain)
    var refreshControl = UIRefreshControl()
    var navigationBar = UINavigationBar(frame: CGRectMake(0, 0, 375, 64))
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewController.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: "didEmoji", forControlEvents: .ValueChanged)
        self.refreshControl.backgroundColor = UIColor.whiteColor()
        self.refreshControl.attributedTitle = NSAttributedString(string: "last updated on \(NSDate())")
        
        data = emoji1
        let emojiTableView = self.tableViewController.tableView
        emojiTableView.backgroundColor = UIColor.grayColor()
        emojiTableView.dataSource = self
        emojiTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIndentifer)
        emojiTableView.frame = CGRectMake(0, 64, 375, self.view.frame.height - 64)
        //emojiTableView.tableFooterView = UIView(frame: CGRectZero)
        //emojiTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(emojiTableView)
        
        
        navigationBar.barStyle = UIBarStyle.BlackTranslucent
        self.view.addSubview(navigationBar)
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIndentifer) as UITableViewCell
        cell.textLabel?.text = self.data[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    
    func didEmoji() {
        self.data += emoji2
        self.tableViewController.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }

}

