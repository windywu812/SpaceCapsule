//
//  CategoryViewController.swift
//  SpaceCapsule
//
//  Created by Windy on 29/03/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit

class CategorySolarSystemViewController: UIViewController {
        
    var image = [UIImage(named: "Oval"), UIImage(named: "Oval Copy 2")]
    var progress = 20
    
    @IBOutlet weak var currentPosition: UIImageView!
    @IBOutlet weak var currentPosition2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPosition.image = image[0]
        currentPosition2.image = image[1]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCategoryGalaxy" {
            let vc = segue.destination as! CategoryGalaxyViewController
            vc.progress = progress
        } else if segue.identifier == "toContent" {
            let vc = segue.destination as! ContentViewController
            vc.progress = progress
        }
    }
    
}
