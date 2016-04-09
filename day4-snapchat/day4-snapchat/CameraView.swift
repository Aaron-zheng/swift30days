//
//  CameraView.swift
//  day4-snapchat
//
//  Created by Aaron on 9/4/16.
//  Copyright (c) 2016 sightcorner. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class CameraView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var captureSession: AVCaptureSession?
    var previewLayer: AVCaptureVideoPreviewLayer?
    var stillImageOutput: AVCaptureStillImageOutput?
    var didTakePhoto = false
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        previewLayer?.frame = cameraView.bounds
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarHidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        println(AVCaptureDevice.devices())
        
//        captureSession = AVCaptureSession()
//        captureSession?.sessionPreset = AVCaptureSessionPresetiFrame1280x720
//        
//        let backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
//        
//        if backCamera != nil {
//            var input: AVCaptureDeviceInput!
//            input = AVCaptureDeviceInput(device: backCamera, error: nil)
//            
//            if captureSession?.canAddInput(input) != nil {
//                captureSession?.addInput(input)
//                
//                stillImageOutput?.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
//                
//                if captureSession?.canAddOutput(stillImageOutput) != nil {
//                    captureSession?.addOutput(stillImageOutput)
//                    
//                    previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
//                    previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
//                    previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
//                    cameraView.layer.addSublayer(previewLayer)
//                    captureSession?.startRunning()
//                }
//            }
//        }
    }
    
//    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//        if didTakePhoto == true {
//            imageView.hidden = true
//            didTakePhoto = false
//        } else {
//            imageView.hidden = false
//            didTakePhoto = true
//            didPressTakePhoto()
//        }
//    }
    
//    func didPressTakePhoto() {
//        if let videoConnection = stillImageOutput?.connectionWithMediaType(AVMediaTypeVideo) {
//            videoConnection.videoOrientation = AVCaptureVideoOrientation.Portrait
//        }
//    }
}