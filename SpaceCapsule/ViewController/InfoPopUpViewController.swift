//
//  InfoPopUpViewController.swift
//  SpaceCapsule
//
//  Created by Windy on 30/03/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import UIKit

class InfoPopUpViewController: UIViewController {

    @IBOutlet weak var infoPlanet: UILabel!
    
    let infoPlanetData = [
        "The Sun (or Sol), is the star at the centre of our solar system and is responsible for the Earth’s climate and weather. The Sun is an almost perfect sphere with a difference of just 10km in diameter between the poles and the equator. The average radius of the Sun is 695,508 km (109.2 x that of the Earth) of which 20–25% is the core.",
        "Mercury is the closest planet to the Sun and is also the smallest in our solar system. For every 2 orbits of the Sun, which takes around 88 Earth days, Mercury completes three rotations of its axis. It is gravitationally locked and this rotation is unique to the solar system.",
        "Venus is the second planet planet from the Sun and the third brightest object in Earth’s sky after the Sun and Moon. Venus also referred to as the “morning star” and “evening star” and sometimes referred to as the sister planet to Earth due to their size and mass are so similar. Venus is also the closest planet to Earth.",
        "Earth is the third planet from the Sun. Earth is the only planet in the solar system not named after a mythological being. Instead, it’s name from the Old English word “ertha” and the Anglo-Saxon word “erda” which means ground or soil. Earth was formed somewhere around 4.54 billion years ago and is currently the only known planet to support life and lots of it.",
        "Mars is the fourth planet from the Sun. Like the rest of the planets in the solar system(except Earth), Mars is named after a mythological figure - the Roman god of war. In addition to its official name, Mars is sometimes called the Red Planet because of the brownish-red colour of its surface.",
        "Named after the Roman king of the gods, Jupiter is fitting of its name. Jupiter is easily the largest and most massive planet in the Solar System. It would take 11 Earth lined up next each other to stretch from one side of Jupiter to the other and it would take 317 Earths to equal the mass of Jupiter.",
        "Saturn is the sixth planet from the Sun and second largest largest planet of the Solar System in terms of diameter and mass. If compared, these two planets are extremely similar, because of these factors, Saturn was named after the father of the god Jupiter in Roman mythology.",
        "Uranus, named after the father of the Roman god Saturn, is the seventh planet in the Solar System and third of the gas giants. It is the third largest planet by diameter, yet fourth most massive.",
        "Neptune is the eight planet from the Sun, making it the most distant in the solar system. This gas giant may have formed much closer to the Sun in the early solar system history before migrating out to its current position."]
    
    var planetPosition = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoPlanet.text = infoPlanetData[planetPosition]
        // Do any additional setup after loading the view.
    }
    

}
