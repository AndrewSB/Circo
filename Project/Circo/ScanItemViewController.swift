//
//  ScanItemViewController.swift
//  Circo
//
//  Created by Andrew Breckenridge on 7/29/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit
import AVFoundation

class ScanItemViewController: UIViewController,UIAlertViewDelegate,UITableViewDelegate, UITableViewDataSource, ZBarReaderViewDelegate,UIImagePickerControllerDelegate, AVCaptureMetadataOutputObjectsDelegate {
    
    
    //DECLARATIONS:
    
    var device: AVCaptureDevice?
    var input: AVCaptureDeviceInput?
    var output: AVCaptureMetadataOutput!
    var session: AVCaptureSession!
    var preview: AVCaptureVideoPreviewLayer!
    
    @IBOutlet weak var previewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.requestCameraAccess()
        let osVersion : NSString = UIDevice.currentDevice().systemVersion
        
        println(osVersion.floatValue)
        if osVersion.floatValue >= 7 {
            
            device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
            
            var writeError : NSError? = nil
            input = AVCaptureDeviceInput.deviceInputWithDevice(device, error: &writeError) as? AVCaptureDeviceInput
            
            output = AVCaptureMetadataOutput()
            
            output.setMetadataObjectsDelegate(self,queue: dispatch_get_main_queue())
            
            session = AVCaptureSession()
            session.canSetSessionPreset(AVCaptureSessionPresetHigh)
            if session.canAddInput(input) {
                session.addInput(input)
            }
            if session.canAddOutput(output){
                session.addOutput(output)
            }
            
            output.metadataObjectTypes = [AVMetadataObjectTypeEAN13Code,AVMetadataObjectTypeEAN8Code,AVMetadataObjectTypeQRCode]
            
            
            //init
            preview = AVCaptureVideoPreviewLayer(session: session)
            
            preview.videoGravity = AVLayerVideoGravityResizeAspectFill
            
            preview.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)
            
            self.view.layer.addSublayer(preview)
            
            session.startRunning()
            
            
        }else {
            if self.isCameraAllowed() {
                var readView:ZBarReaderView = ZBarReaderView()
                readView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
                readView.readerDelegate = self; //set up delegate
                readView.allowsPinchZoom = true
                readView.scanCrop = getScanCrop(CGRectMake(0, 0, 320, 480),readerViewBounds:self.view.bounds)
                println(self.view.bounds)
                
                self.view.addSubview(readView)
                
                readView.start()
            }
            else{
                println("No user carme !!")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getScanCrop(rect:CGRect, readerViewBounds:CGRect) -> (CGRect)
    {
        return CGRectMake(rect.origin.x / readerViewBounds.size.width, rect.origin.y / readerViewBounds.size.height, rect.size.width / readerViewBounds.size.width, rect.size.height / readerViewBounds.size.height)
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return 0
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        let CellID:NSString = "adBusinessTableViewCell"
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(CellID) as UITableViewCell
        
        return cell
    }
    
    func readerView(readerView: ZBarReaderView?, didReadSymbols symbols: ZBarSymbolSet?, fromImage image: UIImage?)
    {
        
        //        readerView.stop
        //        let symbol:zbar_symbol_t = zbar_symbol_set_first_symbol(symbols.zbarSymbolSet)
        
    }
    
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!)
    {
        if metadataObjects.count > 0 {
            let metadataObject: AVMetadataMachineReadableCodeObject = metadataObjects[0] as AVMetadataMachineReadableCodeObject
            println(metadataObject.stringValue)
            
            /*
                App has recognized a barcode/ qrcode
                Have deterministic logic that stratifies the result into a parsable barcode int or a string webadress to be opened in a UIWebView
            */
            
            
            
        }
        
    }
    
    
    
    func requestCameraAccess() {
        AVCaptureDevice.requestAccessForMediaType(AVMediaTypeVideo, completionHandler: {(granted: Bool!) in
            })
    }
    
    func isCameraAllowed() -> Bool {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            return true
        } else {
            return false
        }
    }
    
    func websiteOrBarcode(input: String) -> (String?, Int?) {
        if let a = input.toInt() {
            return (nil,a)
        } else {
            return (input, nil)
        }
    }
} //Bank of America Account Got Six Figures

