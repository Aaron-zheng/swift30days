//
//  CameraView.swift
//  day4-snapchat
//
//  Created by Aaron on 8/4/16.
//  Copyright (c) 2016 sightcorner. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class CameraView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var cameraView: UIView!
    
    var captureSession: AVCaptureSession?
    var stillImageOutput: AVCaptureStillImageOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        previewLayer?.frame = cameraView.bounds
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        return
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)!
        var error: NSError?
        var input: AVCaptureDeviceInput = AVCaptureDeviceInput(device: backCamera, error: nil)
        
        captureSession?.addInput(input)
        stillImageOutput = AVCaptureStillImageOutput()
        stillImageOutput?.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
        
        if captureSession?.canAddOutput(stillImageOutput) != nil {
            captureSession?.addOutput(stillImageOutput)
            
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        }
    }
}
