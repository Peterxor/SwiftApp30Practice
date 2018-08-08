//
//  ViewController.swift
//  PJ8-RandomColorization
//
//  Created by Peter on 2018/8/8.
//  Copyright © 2018 Peter. All rights reserved.
//

import UIKit
import AVFoundation

class ColorizationViewController: UIViewController {
    var playBtn: UIButton?
    var gradientLayer: CAGradientLayer?
    var audioPlayer: AVAudioPlayer?
    var timer: Timer?
    //207, 368
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        playBtn = UIButton(frame: CGRect(x: 177, y: 338, width: 60, height: 60))
        playBtn?.setBackgroundImage(UIImage(named: "music play"), for: .normal)
        playBtn?.addTarget(self, action: #selector(self.didTouch), for: .touchDown)
        self.view.addSubview(playBtn!)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func didTouch(){
        let musicURL = URL(fileURLWithPath: Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")!)
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: musicURL)
            
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        }catch let error as Error{
            print(error)
        }
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.colorChange), userInfo: nil, repeats: true)
        
        let color1 = UIColor(red: 1, green: 0, blue: 0, alpha: 0.4).cgColor as CGColor
        let color2 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).cgColor as CGColor
        let color3 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).cgColor as CGColor
        
        
        
        gradientLayer = CAGradientLayer()
        gradientLayer?.frame = self.view.bounds
        gradientLayer?.colors = [color1, color2, color3]
        gradientLayer?.locations = [0.3, 0.5, 0.7]
        gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer?.endPoint = CGPoint(x: 1, y: 1)
        
        self.view.layer.addSublayer(gradientLayer!)
        
    }
    
    @objc func colorChange(){
        let baseRed = CGFloat(drand48())
        let baseBlue = CGFloat(drand48())
        let baseGreen = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: baseRed, green: baseGreen, blue: baseBlue, alpha: 1)
    }


}

