//
//  ViewController.swift
//  AudioPlayerBySwift
//
//  Created by liqunfei on 16/6/28.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController,AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer?
    var musicName: String? {
        didSet {
            let filePath: String? = NSBundle.mainBundle().pathForResource(musicName, ofType: nil)
            if filePath != nil {
               let fileUrl = NSURL(fileURLWithPath: filePath!)
                do {
                    audioPlayer = try
                    AVAudioPlayer(contentsOfURL:fileUrl)
                    audioPlayer?.numberOfLoops = 0
                    audioPlayer?.delegate = self
                    audioPlayer?.prepareToPlay()
                }
                catch let error as NSError {
                    print("Could not create audioPlayer:\(error)")
                }
            }
       
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func PlayMusics(sender: UIButton) {
        audioPlayer = nil
        if sender.tag == 101 {
            musicName = "年轮.mp3"
        }
        else if sender.tag == 102 {
            musicName = "月亮可以代表我的心.mp3"
        }
        audioPlayer?.play()
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        print("finished")
    }
}

