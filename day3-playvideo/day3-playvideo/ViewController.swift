//
//  ViewController.swift
//  day3-playvideo
//
//  Created by Aaron on 6/4/16.
//  Copyright (c) 2016 sightcorner. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

struct Video {
    let image: String
    let title: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var videoTableView: UITableView!
    
    var data = [
        Video(image: "videoScreenshot01", title: "Emoji Among Us"),
        Video(image: "videoScreenshot02", title: "introduce 3ds"),
        Video(image: "videoScreenshot03", title: "facebook wall")
    
    ]
    
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoTableView.dataSource = self
        videoTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func playButtonDidTouch(sender: UIButton) {
        let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
        playerView = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        playViewController.player = playerView
        
        self.presentViewController(playViewController, animated: true, completion: {
            self.playViewController.player.play()
        })
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = videoTableView.dequeueReusableCellWithIdentifier("videocell", forIndexPath: indexPath) as VideoCell
        let video = data[indexPath.row]
        cell.videoScreen.image = UIImage(named: video.image)
        cell.videoTitle.text = video.title
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }

}

