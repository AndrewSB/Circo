//
//  CircoView.swift
//  Circo
//
//  Created by Andrew Breckenridge on 7/30/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
class CircoView: UIView {
    var backgroundRingLayer: CAShapeLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !backgroundRingLayer {
            backgroundRingLayer = CAShapeLayer()
            layer.addSublayer(backgroundRingLayer);
        }
        
        backgroundRingLayer.frame = layer.bounds
    }

}
