//
//  ViewController.swift
//  AnimalNoteHeads
//
//  Created by Andreas Larsen on 12/05/15.
//  Copyright (c) 2015 AnimalNoteHeads. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
   
    @IBOutlet weak var c3: KeyButton!
    @IBOutlet weak var cis3: KeyButton!
    @IBOutlet weak var d3: KeyButton!
    @IBOutlet weak var dis3: KeyButton!
    @IBOutlet weak var e3: KeyButton!
    @IBOutlet weak var f3: KeyButton!
    @IBOutlet weak var fis3: KeyButton!
    @IBOutlet weak var g3: KeyButton!
    @IBOutlet weak var gis3: KeyButton!
    @IBOutlet weak var a3: KeyButton!
    @IBOutlet weak var as3: KeyButton!
    @IBOutlet weak var h3: KeyButton!
    @IBOutlet weak var c4: KeyButton!
    @IBOutlet weak var cis4: KeyButton!
    
    let pianoSounds = PianoSounds()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for keyButton in [c3, cis3, d3, dis3, e3, f3, fis3, g3, gis3, a3, as3, h3, c4, cis4] {
            keyButton.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: KeyButtonDelegate {
    
    func beganTouch(keyButton: KeyButton) {
        switch keyButton {
            case c3: pianoSounds.keyDown(.C3)
            case cis3: pianoSounds.keyDown(.Cis3)
            case d3: pianoSounds.keyDown(.D3)
            case dis3: pianoSounds.keyDown(.Dis3)
            case e3: pianoSounds.keyDown(.E3)
            case f3: pianoSounds.keyDown(.F3)
            case fis3: pianoSounds.keyDown(.Fis3)
            case g3: pianoSounds.keyDown(.G3)
            case gis3: pianoSounds.keyDown(.Gis3)
            case a3: pianoSounds.keyDown(.A3)
            case as3: pianoSounds.keyDown(.As3)
            case h3: pianoSounds.keyDown(.H3)
            case c4: pianoSounds.keyDown(.C4)
            case cis4: pianoSounds.keyDown(.Cis4)
            default: break
        }
    }
    
    func endedTouch(keyButton: KeyButton) {
        switch keyButton {
        case c3: pianoSounds.keyUp(.C3)
        case cis3: pianoSounds.keyUp(.Cis3)
        case d3: pianoSounds.keyUp(.D3)
        case dis3: pianoSounds.keyUp(.Dis3)
        case e3: pianoSounds.keyUp(.E3)
        case f3: pianoSounds.keyUp(.F3)
        case fis3: pianoSounds.keyUp(.Fis3)
        case g3: pianoSounds.keyUp(.G3)
        case gis3: pianoSounds.keyUp(.Gis3)
        case a3: pianoSounds.keyUp(.A3)
        case as3: pianoSounds.keyUp(.As3)
        case h3: pianoSounds.keyUp(.H3)
        case c4: pianoSounds.keyUp(.C4)
        case cis4: pianoSounds.keyUp(.Cis4)
        default: break
        }
    }
}