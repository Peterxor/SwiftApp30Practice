//
//  VideoViewController.swift
//  PJ3-PlayLocalVideo
//
//  Created by Peter on 2018/8/1.
//  Copyright © 2018 Peter. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class VideoViewController: UIViewController{
    var video: AVPlayer?
    var videoController: AVPlayerViewController?
    var testbutton: UIButton?
    
    let coverName = ["videoScreenshot01", "videoScreenshot02", "videoScreenshot03", "videoScreenshot04", "videoScreenshot05", "videoScreenshot06"]
    var tableView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        print(width)
        print(height)
        
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        videoController = AVPlayerViewController()
        video = AVPlayer(url: URL.init(fileURLWithPath: path!))
        videoController?.player = video
        
        tableView = UITableView(frame: UIScreen.main.bounds)
        tableView?.register(VideoCell.self, forCellReuseIdentifier: "cell")
        tableView?.dataSource = self
        tableView?.delegate = self
        self.view.addSubview(tableView!)
        
        self.view.backgroundColor = .black
    }
    
    @objc func playVideo(){
        self.present(videoController!, animated: true) {
            self.videoController?.player?.play()
        }
    }
}

extension VideoViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coverName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView?.dequeueReusableCell(withIdentifier: "cell")
        cell?.backgroundView = UIImageView(image: UIImage.init(named: coverName[indexPath.row]))
        var button = UIButton(frame: CGRect(x: 207 - 25, y: 110 - 25, width: 50, height: 50))
        button.setBackgroundImage(UIImage(named: "playBtn"), for: .normal)
        button.addTarget(self, action: #selector(self.playVideo), for: .touchDown)
        cell?.addSubview(button)
        return cell!
    }
    
    
}
