//
//  GalaxyContentViewController.swift
//  SpaceCapsule
//
//  Created by Windy on 31/03/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit

class GalaxyContentViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    // Galaxy Data
    let galaxyPictures = [UIImage(named: "1"),
                          UIImage(named: "2"),
                          UIImage(named: "3"),
                          UIImage(named: "4"),
                          UIImage(named: "5"),
                          UIImage(named: "6"),
                          UIImage(named: "7"),
                          UIImage(named: "8"),
                          UIImage(named: "9"),
                          UIImage(named: "10")]
    let galaxyTitles = ["Milky Way",
                       "What is the centre of our galaxy?",
                       "Where are we exactly?",
                       "What is the nearest star from earth?",
                       "Our Milky Way is going to collision",
                       "Every night you see the past",
                       "We are the star",
                       "What is the fastest object in universe?",
                       "First Image of Black Hole",
                       "What is happening when star die?"]
    let galaxyContents = ["The Milky Way is massive. It measures 100,000–120,000 light-years in diameter and about 1,000 light-years thick and up to 400 billion stars are located within it (even more). One light year is about 9.5 x 1,012 km (9.5 trillion km), if our solar system were the size of a U.S. quarter, the sun would be a microscopic piece of dust and the Milky Way would be about the size of the United States.",
                          "Most larger galaxies have a supermassive black hole at the centre, and the Milky Way is no exception. The center of our galaxy is called Sagittarius A*, a massive source of radio waves that is believed to be a black hole that measures 22,5 million km (14 million miles) across – about the size of Mercury’s orbit.",
                          "The Solar System  is located about 25,000 light-years to the galactic centre and 25,000 light-years away from the rim. So basically, if you were to think of the Milky Way as a big record, we would be the spot between the centre and the edge.",
                          "Earth’s closest star is Alpha Centauri, is more than four light-years away (about 10 trillion km). Proxima is Latin for “close”. While the Milky Way contains up to about 400 billion stars, you can only see 0.0000025% of all the stars when you look up the sky at night.",
                          "Right now, the Milky Way and another spiral galaxy called Andromeda are moving toward each other. They are approaching each other at about 75 miles (120 km) per second. This collision predicted to occur in about 4.5 billion years.",
                          "The stars that you see in the night sky is probably already dead. What is it mean? If the nearest star is 4 light years away, that means it needs 4 year to the light to come to earth. So if the star is already dead, it will need 4 years that we already notice it’s already dead. If our sun is disappear, it will ±8 minutes to notice that is already disappear because it needs ±8 minutes to light to come to earth.",
                          "The reality is almost every element found on Earth was created in the burning core of a star, all the stuff that makes up life on Earth, therefore our bodies are made from stardust. “The nitrogen in our DNA, the calcium in our teeth, the iron in our blood, the carbon in our apple pies were made in the interiors of collapsing stars. We are made of starstuff.”",
                          "Neutron stars are the fastest spinning objects in the universe. How fast? Which is spinning at 24% the speed of light, which translates to over 70,000 km per second. If you could collect a tablespoon of matter from the centre of a neutron star, it would weigh about one billion tons",
                          "A black hole isn’t really a hole. It’s an object in space with incredible mass packed into a very small area. All that mass creates such a huge gravitational tug that nothing can escape a black hole, including light. This supermassive monster lies in a galaxy called M87.",
                          "The star dies depends in its own mass. Star that about 8-15 solar masses will turn to supernova after it runs out of its fuel. But for start that around 20-30 solar masses might not explode to supernova, but turn to black hole."]
                     
    var position = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.isUserInteractionEnabled = true
        
        pictureImage.layer.cornerRadius = 20
        
        setPlanetData(position: position)
        
        // Hande the swipe gesture
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture(sender:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture(sender:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        view.addGestureRecognizer(swipeLeft)
    }
    
   
    @objc func swipeGesture(sender: UISwipeGestureRecognizer?) {
        if let swipeGesture = sender {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if position != 9 {
                    position += 1
                    setPlanetData(position: position)
                } else if position == 9 {
                    setPlanetData(position: position)
                }
            case UISwipeGestureRecognizer.Direction.right:
                if position != 0 {
                    position -= 1
                    setPlanetData(position: position)
                } else if position == 0 {
                    setPlanetData(position: position)
                }
            default:
                break
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CategoryGalaxyViewController
        vc.progress = 100
    }
    
    func setPlanetData(position: Int) {
        titleLabel.text = galaxyTitles[position]
        pictureImage.image = galaxyPictures[position]
        contentLabel.text = galaxyContents[position]
    }
    

}
