//
//  imageViewController.swift
//  LandmarkBook
//
//  Created by testinium on 15.09.2020.
//  Copyright © 2020 testinium. All rights reserved.
//

import UIKit

class imageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelDetail: UILabel!
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelDetail.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
        
    }
    


}
