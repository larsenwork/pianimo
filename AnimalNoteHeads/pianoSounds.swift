//
//  pianoSounds.swift
//  AnimalNoteHeads
//
//  Created by Andreas Larsen on 13/05/15.
//  Copyright (c) 2015 AnimalNoteHeads. All rights reserved.
//

import Foundation
import AVFoundation

class PianoSounds {
    enum Tangent: String {
        case C3 = "c3"
        case Cis3 = "cis3"
        case D3 = "d3"
        case Dis3 = "dis3"
        case E3 = "e3"
        case F3 = "f3"
        case Fis3 = "fis3"
        case G3 = "g3"
        case Gis3 = "gis3"
        case A3 = "a3"
        case As3 = "as3"
        case H3 = "h3"
        case C4 = "c4"
        case Cis4 = "cis4"
    }
    
    var audioPlayers = [Tangent : AVAudioPlayer]()
    
    // This gets the file URL
    func setupAudioPlayerWithFile(file: String) -> AVAudioPlayer? {
        if let path = NSBundle.mainBundle().pathForResource(file as String, ofType: "aiff"){
            var url = NSURL.fileURLWithPath(path)
            var error: NSError?
            let audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
            return audioPlayer
        }
        println("Couldn't find resource for " + file + ", so couldn't create audioPlayer")
        return nil
    }
    
    func audioPlayer(tangent: Tangent) -> AVAudioPlayer? {
        // Check if audioPlayer already exists
        if let audioPlayer = audioPlayers[tangent] {
            return audioPlayer
        }
        // Create new audioplayer
        if let audioPlayer = setupAudioPlayerWithFile(tangent.rawValue) {
            audioPlayers[tangent] = audioPlayer // Store audioplayer
            return audioPlayer
        }
        return nil
    }

    func keyDown(tangent: Tangent) {
        audioPlayer(tangent)?.play()
    }
    
    // Stops the music
    func keyUp(tangent: Tangent) {
        audioPlayer(tangent)?.fadeToStop()
    }
}

// Helps with stopping the music
extension AVAudioPlayer {
    private func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    func fadeToStop() {
        volume = 0.01
        delay(0.01) {
            self.volume = 0.001
            self.delay(0.02) {
                self.volume = 0.0001
                self.delay(0.03) {
                    self.volume = 0
                    self.stop()
                    self.currentTime = 0.0
                    self.volume = 1
                }
            }
        }
    }
}