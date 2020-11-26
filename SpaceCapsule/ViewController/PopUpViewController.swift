//
//  PopUpViewController.swift
//  SpaceCapsule
//
//  Created by Windy on 30/03/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet weak var didYouKnow: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var buttonAbsolutely: UIButton!
    @IBOutlet weak var buttonNeverHeard: UIButton!
    @IBOutlet weak var respondImage: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    // Current position
    var planetPosition = 0
    var xPosition = 0
    var progress = 0
    
    // Planet data
    let questionEachPlanet = ["You know our sun is big rigth, but do you know actually how big it is?",
                              "Do you know how long 1 year and 1 day on Mercury?",
                              "Venus is the hottest planet, but do you know the interesting one about Venus?",
                              "Earth once had two moons..",
                              "Is the Mount Everest highest in our earth?",
                              "Are you want to live in a short day?",
                              "Are you scared of storm?",
                              "Have you gone to South Pole? Temperature in there is ±50°C, but we have something colder than that?",
                              "Do you know planet that has ring beside Saturn?"]
    let answerQuestionEachPlanet = ["The sun takes around 99,86 % mass of our solar system",
                                    "A year is 88 days, yet a Mercury day is 176 days. Does it makes sense?",
                                    "Venus spins backwards, with it’s sun rising from the west",
                                    "Earth may have once had two moons, but one was destroyed in a slow-motion collision that left our current lunar orb lumpier on once side than the other",
                                    "There is one mountain that 3x higher than Mt. Everest. It is Mon Olympus which is highest in our solar system",
                                    "Jupiter is the answer, one day in Jupiter is 9 hours 55 minutes.",
                                    "Storms on Saturn can last for months or years, named the “Dragon Storm”, created mega-lighting 1,000 times more powerful than lighting on Earth.",
                                    "Uranus is the coldest planet which is minimum surface temperature is -224°C",
                                    "Neptune has not only 1 ring, but 5 rings which are Galle, Leverrier, Lassell, Arago and Adams"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = questionEachPlanet[planetPosition]
        
    }
    
    // Button Function
    @IBAction func absolutely(_ sender: Any) {
        hiddenAllContent()
        respondImage.image = UIImage(named: "Absolutely")
        respondImage.isUserInteractionEnabled = true
    }
    @IBAction func neverHeardThat(_ sender: Any) {
        hiddenAllContent()
        respondImage.image = UIImage(named: "NeverHeard")
        respondImage.isUserInteractionEnabled = true
    }
    @IBAction func isClicked(_ sender: Any) {
        answerLabel.text = answerQuestionEachPlanet[planetPosition]
        nextButton.isHidden = false
        respondImage.isHidden = true
    }
    @IBAction func nextClicked(_ sender: Any) {
        if progress == 100 {
            performSegue(withIdentifier: "toCategoryGalaxy", sender: self)
        } else {
            performSegue(withIdentifier: "toContent", sender: self)
        }
    }
    
    // Pass data within view controller with Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toContent" {
            let vc = segue.destination as! ContentViewController
            vc.planetPosition = planetPosition + 1
            vc.xPosition = xPosition + 40
            vc.progress = progress + 10
        } else if segue.identifier == "toCategoryGalaxy" {
            let vc = segue.destination as! CategoryGalaxyViewController
            vc.progress = progress
        }
    }
    
    // Function to hide content
    func hiddenAllContent() {
         didYouKnow.isHidden = true
         questionLabel.isHidden = true
         buttonAbsolutely.isHidden = true
         buttonNeverHeard.isHidden = true
     }
}
