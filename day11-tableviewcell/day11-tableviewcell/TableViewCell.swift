//
//  TableViewCell.swift
//  day11-tableviewcell
//
//  Created by Aaron on 18/4/16.
//  Copyright © 2016 sightcorner. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    let gradientLayer = CAGradientLayer()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        gradientLayer.frame = self.bounds
        let color1 = UIColor(white: 1.0, alpha: 0.2).CGColor as CGColorRef
        let color2 = UIColor(white: 1.0, alpha: 0.1).CGColor as CGColorRef
        let color3 = UIColor.clearColor().CGColor as CGColorRef
        let color4 = UIColor(white: 0.0, alpha: 0.05).CGColor as CGColorRef
        
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.0, 0.04, 0.95, 1.0]
        
        layer.insertSublayer(gradientLayer, atIndex: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = self.bounds
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}