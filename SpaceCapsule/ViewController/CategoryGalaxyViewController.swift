//
//  CategoryGalaxyViewController.swift
//  SpaceCapsule
//
//  Created by Windy on 29/03/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit

class CategoryGalaxyViewController: UIViewController {

    var image = [UIImage(named: "Oval"), UIImage(named: "Oval Copy 2")]
    var progress = 0
    
    @IBOutlet weak var currentPosition: UIImageView!
    @IBOutlet weak var currentPosition2: UIImageView!
    @IBOutlet weak var lockedLabel: UIImageView!
    @IBOutlet weak var lockImage: UIButton!
    @IBOutlet weak var exploreGalaxyLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set content data
        currentPosition.image = image[0]
        currentPosition2.image = image[1]
        if progress == 100 {
            lockedLabel.isHidden = true
            lockImage.isHidden = true
            exploreGalaxyLabel.isHidden = false
        }
    }
    
    // Pass data within viewcontroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSolarSystem" {
            let vc = segue.destination as! CategorySolarSystemViewController
            vc.progress = progress
        }
    }

    @IBAction func exploreGalaxy(_ sender: Any) {
    }
}
