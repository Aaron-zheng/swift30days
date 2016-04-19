//
//  ClearTableViewController.swift
//  day11-tableviewcell
//
//  Created by Aaron on 18/4/16.
//  Copyright © 2016 sightcorner. All rights reserved.
//

import UIKit

class ClearTableViewController: UITableViewController {
    
    var tableData = ["跟着我左手右手一个慢动作", "左手右手慢动作重播", "给我你的爱，陪着我去未来", "这个世界如此的艰难，为什么还要拆穿", "浪花兄弟"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "tablecell")
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tablecell", forIndexPath: indexPath)
        
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 12)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let itemCount = tableData.count - 1
        let color = (CGFloat(indexPath.row) / CGFloat(itemCount)) * 0.5
        
        cell.backgroundColor = UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
    }
    
}