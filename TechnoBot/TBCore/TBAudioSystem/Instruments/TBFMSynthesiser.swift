//
//  TBFMSynthesiser.swift
//  TechnoBot
//
//  Created by Matthew Mansell on 07/03/2018.
//  Copyright © 2018 MatthewMansell. All rights reserved.
//

import Foundation
import AudioKit

/// Wrapper for AKFM Oscillator
public class TBFMSynthesiser : TBInstrument {
    
    private var fMO = AKFMOscillator()
    var x = 0;
    
    init() {
        super.init()
        instrumentID = "FM"
        fMO.presetWobble()
        fMO.amplitude = 0.08
    }
    
    override public func start(noteNumber: MIDINoteNumber, velocity: MIDIVelocity, channel: MIDIChannel) {
        print(x); x+=1
        fMO.baseFrequency = noteNumber.midiNoteToFrequency()
        //fMO.carrierMultiplier = noteNumber.midiNoteToFrequency()-5
        fMO.start()
    }
    
    override public func stop(noteNumber: MIDINoteNumber, channel: MIDIChannel) { fMO.stop() }
    override public func getOutput() -> AKNode { return fMO }
    override public func pitchBend(_ time: Double) { fMO.rampTime = time }
}
