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
        
        
//        var currentUser = PFUser.currentUser()
//        if currentUser {
//            // Logged in, ready to go
//        } else {
//            // Segue to Sign Up/ Login
//        }
//        
//        // Assume logged in from this point
        
        
    }
    
    func checkDeviceAuthorizationStatus() {
        var mediaType = AVMediaTypeVideo
        
        AVCaptureDevice.requestAccessForMediaType(mediaType, completionHandler:{bool -> Void in
            //do code
            })
    }
    
    
//    func signUp(username: NSString!, password: NSString!) -> Void {
//        
//        // Get information from view, pass to below
//        
//        var user = PFUser()
//        user.username = username
//        user.password = password
//        user.email = user.username
//        
//        user.signUpInBackgroundWithBlock {
//            (succeeded: Bool!, error: NSError!) -> Void in
//            if !error {
//                // Hooray! Let them use the app now.
//            } else {
//                let errorString = error.userInfo["error"] as NSString
//                // Show the errorString somewhere and let the user try again.
//            }
//        }
//
//    }
//    
//    func login(username: NSString!, password: NSString!) -> Void {
//        PFUser.logInWithUsernameInBackground(username, password: password) {
//            (user: PFUser!, error: NSError!) -> Void in
//            if user {
//                // Do stuff after successful login.
//            } else {
//                // The login failed. Check error to see why.
//            }
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

