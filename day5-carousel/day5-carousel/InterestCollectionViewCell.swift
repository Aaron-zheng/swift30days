//
//  InterestCollectionViewCell.swift
//  day5-carousel
//
//  Created by Aaron on 9/4/16.
//  Copyright (c) 2016 sightcorner. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        image.image = interest.featuredImage
        label.text = interest.title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
