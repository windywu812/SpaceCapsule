//
//  Sound.swift
//  SpaceCapsule
//
//  Created by Windy on 04/04/20.
//  Copyright © 2020 Windy. All rights reserved.
//

import Foundation
import AVFoundation

class Sound {
    
    static func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            let player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}
