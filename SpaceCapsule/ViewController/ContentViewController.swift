//
//  ContentViewController.swift
//  SpaceCapsule
//
//  Created by Windy on 29/03/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var rectanglePlanetView: UIImageView!
    @IBOutlet weak var planetView: UIImageView!
    @IBOutlet weak var planetNameLabel: UILabel!
    @IBOutlet weak var planetDistanceLabel: UILabel!
    @IBOutlet weak var planetDiameterLabel: UILabel!
    @IBOutlet weak var labelTraining: UIImageView!
    @IBOutlet weak var rectanglePosition: UIImageView!
        
    // Planet Data
    let planetImages = [UIImage(named: "sun copy"),
                        UIImage(named: "mercury"),
                        UIImage(named: "venus"),
                        UIImage(named: "earth"),
                        UIImage(named: "mars"),
                        UIImage(named: "jupiter"),
                        UIImage(named: "saturn"),
                        UIImage(named: "uranus"),
                        UIImage(named: "neptune")]
    let planetNames = ["THE SUN",
                       "MERCURY",
                       "VENUS",
                       "EARTH",
                       "MARS",
                       "JUPITER",
                       "SATURN",
                       "URANUS",
                       "NEPTUNE"]
    let planetDistance = ["± 0 km",
                          "± 57,900,000 km",
                          "± 108,000,000 km",
                          "± 150,000,000 km",
                          "± 228,000,000 km",
                          "± 779,000,000 km",
                          "± 1,430,000,000 km",
                          "± 2,880,000,000 km",
                          "± 4,500,000,000 km"]
    let planetDiameter = ["± 1,392,700 km",
                          "± 4,879.4 km",
                          "± 12,104 km",
                          "± 12,756 km",
                          "± 6,779 km",
                          "± 139,820 km",
                          "± 116,460 km",
                          "± 50,724 km",
                          "± 49,244 km"]
    
    // Show current position
    var planetPosition: Int = 0
    var xPosition = 0
    var progress = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        planetView.isUserInteractionEnabled = true
        
        // Conditional if index out of bounds
        if planetPosition > 8 {
            planetPosition = 8
        }
        if xPosition > 320 {
            xPosition = 320
        }
        if progress > 100 {
            progress = 100
        }
        
        // Set planet view with new data
        animationMove(x: CGFloat(xPosition))
        labelTraining.image = UIImage(named: "TO START YOUR TRAINI")
        setPlanetData(position: planetPosition)

        // Handle the swipe gesture
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture(sender:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        planetView.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture(sender:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        planetView.addGestureRecognizer(swipeLeft)

    }
    
    // Function that handle swipe gesture
    @objc func swipeGesture(sender: UISwipeGestureRecognizer?) {
        if let swipeGesture = sender {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if planetPosition != 8 {
                    // Do animation
                    xPosition += 40
                    animationMove(x: CGFloat(xPosition))
                    // Set new planet data
                    planetPosition += 1
                    setPlanetData(position: planetPosition)
                    labelTraining.image = UIImage(named: "toContinue")
                } else if planetPosition == 8 {
                    // Set new planet data
                    setPlanetData(position: 8)
                    labelTraining.image = UIImage(named: "toContinue")
                    animationMove(x: CGFloat(320))
                }
            case UISwipeGestureRecognizer.Direction.right:
                if planetPosition != 0 {
                    // Do animation
                    xPosition -= 40
                    animationMove(x: CGFloat(xPosition))
                    // Set new planet data
                    planetPosition -= 1
                    setPlanetData(position: planetPosition)
                    labelTraining.image = UIImage(named: "toContinue")
                } else if planetPosition == 0 {
                    // Do animation
                    animationMove(x: CGFloat(0))
                    // Set new planet data
                    setPlanetData(position: 0)
                    labelTraining.image = UIImage(named: "TO START YOUR TRAINI")
                }
            default:
                break
            }
        }
    }

    // Pass data within viewController with Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPopUp" {
            let vc = segue.destination as! PopUpViewController
            vc.planetPosition = planetPosition
            vc.xPosition = xPosition
            vc.progress = progress
        } else if segue.identifier == "infoPopUp" {
            let vc = segue.destination as! InfoPopUpViewController
            vc.planetPosition = planetPosition
        } else if segue.identifier == "toCategorySolarSystem" {
            let vc = segue.destination as! CategorySolarSystemViewController
            vc.progress = progress
        }
    }
   
    // Animation function
    func animationMove(x: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.rectanglePosition.transform = CGAffineTransform(translationX: x, y: 0)
        }
    }
    
    // Set planet Data
    func setPlanetData(position: Int) {
        planetView.image = planetImages[position]
        planetNameLabel.text = planetNames[position]
        planetDiameterLabel.text = planetDiameter[position]
        planetDistanceLabel.text = planetDistance[position]
    }
}
