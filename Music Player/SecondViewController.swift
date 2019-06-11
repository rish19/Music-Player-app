//
//  SecondViewController.swift
//  Music Player
//
//  Created by Rishabh Bhandari on 11/06/19.
//  Copyright © 2019 Rishabh Bhandari. All rights reserved.
//

import UIKit
import AVFoundation
class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var songImage: UIImageView!
    @IBAction func play(_ sender: Any) {
        if audioPlayer.isPlaying == false {
            audioPlayer.play()
        }
    }
    
    @IBAction func pause(_ sender: Any) {
        if audioPlayer.isPlaying{
            audioPlayer.pause()
        }
    }
    
    @IBAction func prev(_ sender: Any) {
        if thisSong != 0 {
            playThis(thisOne: songs[thisSong-1])
            songName.text = songs[thisSong-1]
            thisSong -= 1
        }
    }
    
    @IBAction func next(_ sender: Any) {
        if thisSong != songs.count-1 {
        playThis(thisOne: songs[thisSong+1])
            songName.text = songs[thisSong+1]
            thisSong += 1
        }
        
    }
    
    @IBAction func volume(_ sender: UISlider) {
        audioPlayer.volume = sender.value
    }
    
    func playThis(thisOne:String){
        do {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            
        }
        catch {
            print("error")
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        songName.text = songs[thisSong]
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        songName.text = songs[thisSong]

    }


}


