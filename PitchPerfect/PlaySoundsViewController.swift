//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Barnis Marinho on 26/05/2018.
//  Copyright © 2018 Udacity. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vadderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL : URL!
    var audioFile : AVAudioFile!
    var audioEngine : AVAudioEngine!
    var audioPlayerNode : AVAudioPlayerNode!
    var stopTimer : Timer!
    
    enum ButtonType : Int{
        case slow = 0, fast, chipmunk, vadder, echo, reverb
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton){
        switch(ButtonType(rawValue: sender.tag)!){
        case .slow:
            print(sender.tag)
            playSound(rate: 0.5)
        case .fast:
            print(sender.tag)
            playSound(rate: 1.5)
        case .chipmunk:
            print(sender.tag)
            playSound(pitch: 1000)
        case .vadder:
            print(sender.tag)
            playSound(pitch: -1000)
        case .echo:
            print(sender.tag)
            playSound(echo: true)
        case .reverb:
            print(sender.tag)
            playSound(reverb: true)
        }
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject){
        stopAudio()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }


}
