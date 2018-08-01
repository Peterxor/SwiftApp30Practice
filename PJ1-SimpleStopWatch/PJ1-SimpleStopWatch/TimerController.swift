//
//  TimerController.swift
//  PJ1-SimpleStopWatch
//
//  Created by Peter on 2018/7/31.
//  Copyright © 2018 Peter. All rights reserved.
//

import Foundation
import UIKit

class TimerController: UIViewController{
    var click: UIButton?
    var label: UILabel?
    var time: Int?
    var start: Int?
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        time = 0
        start = 1
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        print("width: " + width.description + ", height: " + height.description)
        click = UIButton(frame: CGRect(origin: CGPoint(x: 167, y: 500), size: CGSize(width: 80, height: 80)))
        click?.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        click?.layer.cornerRadius = 40
        click?.addTarget(self, action: #selector(clickTouch), for: .touchDown)
        click?.adjustsImageWhenHighlighted = true
        click?.adjustsImageWhenDisabled = true
        click?.setTitle("click", for: .normal)
        self.view.addSubview(click!)
        
        label = UILabel(frame: CGRect(x: 97, y: 110, width: 220, height: 220))
        label?.backgroundColor = .clear
        label?.font = UIFont.systemFont(ofSize: 150)
        label?.textAlignment = .center
        label?.text = String(time!)
        self.view.addSubview(label!)
    }
    
    @objc func clickTouch(){
        if(start == 1){
            start = 2
            self.click?.backgroundColor = .red
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.count), userInfo: nil, repeats: true)
        }else if(start == 2){
            start = 1
            click?.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
            timer?.invalidate()
        }
    }
    
    @objc func count(){
        time = time! + 1
        self.label?.text = String(time!)
    }
    
    
}
