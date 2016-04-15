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

    /*
    private func setZoomScaleFor(scrollViewSize: CGSize) {
        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let minimunScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minimunScale
        scrollView.maximumZoomScale = 3.0
    }
    */
    
    
    private func recenterImage() {
        let scrollViewSize = scrollView.bounds.size
//        print(scrollViewSize)
        let imageViewSize = imageView.frame.size
//        print(imageViewSize)
        let halfhorizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0.0
        let halfverticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2.0 : 0.0
        
        scrollView.contentInset = UIEdgeInsetsMake(halfverticalSpace, halfhorizontalSpace, halfverticalSpace, halfhorizontalSpace)
        
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "apple"))
        
        scrollView = UIScrollView(frame: self.view.bounds)
//                scrollView.backgroundColor = UIColor.clearColor()
//        scrollView.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
//        scrollView.contentSize = imageView.bounds.size
        scrollView.addSubview(imageView)
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
        view.addSubview(scrollView)
        
        scrollView.zoomScale = scrollView.minimumZoomScale
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidZoom(scrollView: UIScrollView) {
        self.recenterImage()
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}

