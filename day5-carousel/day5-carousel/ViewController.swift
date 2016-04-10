//
//  ViewController.swift
//  day5-carousel
//
//  Created by Aaron on 9/4/16.
//  Copyright (c) 2016 sightcorner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let cellIndentifier = "interestcell"
    var interests = Interest.createInterests()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        println("2")
        return interests.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        println("1")
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIndentifier, forIndexPath: indexPath) as InterestCollectionViewCell
        
        cell.interest = self.interests[indexPath.item]
        return cell
    }
}
