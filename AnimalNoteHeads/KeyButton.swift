//
//  buttons.swift
//  AnimalNoteHeads
//
//  Created by Andreas Larsen on 13/05/15.
//  Copyright (c) 2015 AnimalNoteHeads. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

protocol KeyButtonDelegate {
    func beganTouch(keyButton: KeyButton)
    func endedTouch(keyButton: KeyButton)
}

class KeyButton: UIButton {
    var delegate: KeyButtonDelegate?
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        highlighted = true
        delegate?.beganTouch(self)
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        highlighted = false
        delegate?.endedTouch(self)
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        highlighted = false
    }
}
