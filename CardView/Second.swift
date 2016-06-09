//
//  Second.swift
//  CardView
//
//  Created by Duong Nguyen on 01/06/2016.
//  Copyright © 2016 Oliu. All rights reserved.
//

import Foundation
import UIKit

class Second: UIViewController {    
    var shimmer: FBShimmeringView!
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        // pan gesture to open
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // shimmering effect for image
        shimmer = FBShimmeringView(frame: self.imageView.frame)
        shimmer.contentView = imageView
        self.view.addSubview(shimmer)
        shimmer.shimmering = true
    }
}