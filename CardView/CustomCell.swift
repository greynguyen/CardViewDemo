//
//  CustomCell.swift
//  CardView
//
//  Created by Duong Nguyen on 31/05/2016.
//  Copyright © 2016 Oliu. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var backgroundCell: UIView!
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var restaurantDescription: UILabel!
    
    var episode: Episode! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        backgroundCell.backgroundColor = UIColor.whiteColor()
        location.text = episode.location
        title.text = episode.title
        restaurantDescription.text = episode.description
        backgroundCell.layer.shadowColor = UIColor.blackColor().colorWithAlphaComponent(0.2).CGColor
        
        backgroundCell.layer.shadowOffset = CGSize(width: 0, height: 0)
        backgroundCell.layer.shadowOpacity = 0.8
        
        // set crop image to bounds
        cellImage.clipsToBounds = true
    }
    
    func updateImage(path: String) {
        self.cellImage.image = UIImage.init(named: episode.imagePath!)
    }
}
