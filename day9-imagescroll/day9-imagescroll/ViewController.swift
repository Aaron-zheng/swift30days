//
//  ViewController.swift
//  day9-imagescroll
//
//  Created by Aaron on 13/4/16.
//  Copyright (c) 2016 sightcorner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var imageView: UIImageView!
    var scrollView: UIScrollView!
    
    private func setZoomScaleFor(scrollViewSize: CGSize) {
        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let minimunScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minimunScale
        scrollView.maximumZoomScale = 3.0
    }
    
    private func recenterImage() {
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "apple"))
        
        scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.autoresizingMask = UIViewAutoresizing()
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.contentSize = imageView.bounds.size
        scrollView.addSubview(imageView)
        scrollView.delegate = self
        view.addSubview(scrollView)
        
        setZoomScaleFor(scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

