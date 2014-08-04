//
//  ViewController.swift
//  Circo
//
//  Created by Andrew Breckenridge on 7/28/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit
import AVFoundation

class MainMenuViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create the background transparent view thing
        
        
    }
    
    func checkDeviceAuthorizationStatus() {
        var mediaType = AVMediaTypeVideo
        
        AVCaptureDevice.requestAccessForMediaType(mediaType, completionHandler:{bool -> Void in
            //do code
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

