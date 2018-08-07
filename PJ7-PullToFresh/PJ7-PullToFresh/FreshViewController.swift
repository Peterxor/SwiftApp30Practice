//
//  ViewController.swift
//  PJ7-PullToFresh
//
//  Created by Peter on 2018/8/7.
//  Copyright © 2018 Peter. All rights reserved.
//

import UIKit

class FreshViewController: UICollectionViewController{
    
    var freshControl: UIRefreshControl?
    let data = ["blue", "bodyline", "darkvarder", "dudu"]
    let newdata = ["hello", "hhhhh", "run", "wave"]
    
    var curData: [String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.backgroundColor = .gray
        curData = data
        freshControl = UIRefreshControl(frame: CGRect(x: 0, y: 0, width: (self.collectionView?.frame.width)!, height: (self.collectionView?.frame.height)!))
        freshControl?.attributedTitle = NSAttributedString.init(string: "Refreshing. Please Wait..", attributes: [NSAttributedStringKey.foregroundColor : UIColor.red])
        freshControl?.backgroundColor = .blue
        freshControl?.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        self.collectionView?.refreshControl = self.freshControl
        
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "standard")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (curData?.count)!
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: "standard", for: indexPath)
        cell?.backgroundView = UIImageView(image: UIImage(named: curData![indexPath.row]))
        return cell!
    }
    
    @objc func refresh(){
        self.collectionView?.refreshControl?.beginRefreshing()
        curData = newdata
        self.collectionView?.reloadData()
        self.collectionView?.refreshControl?.endRefreshing()
    }
}

