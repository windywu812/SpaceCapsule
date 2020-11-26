//
//  ViewController.swift
//  SpaceCapsule
//
//  Created by Windy on 27/03/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
        
    let sound = Sound()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        Sound.playSound(soundName: "music")
    }

}

