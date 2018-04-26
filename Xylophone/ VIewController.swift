//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController{
    

    var objPlayer: AVAudioPlayer?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }


    @IBAction func notePressed(_ sender: UIButton) {
        
        let buttonPressed: Int = sender.tag
        
        playSound(noteNum: buttonPressed)
        
        
        
    }
    
    func playSound (noteNum: Int) {
        guard let url = Bundle.main.url(forResource: "note\(noteNum)", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            // For iOS 11
            objPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            
            guard let aPlayer = objPlayer else { return }
            aPlayer.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        print(noteNum)
    }

}

