//
//  ViewController.swift
//  PJ5-CarouselEffect
//
//  Created by Peter on 2018/8/4.
//  Copyright © 2018 Peter. All rights reserved.
//

import UIKit

class CollectionController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    let data = ["blue", "bodyline", "darkvarder", "dudu", "hello", "hhhhh", "run", "wave"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "standard")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: "standard", for: indexPath)
        cell?.backgroundView = UIImageView(image: UIImage(named: data[indexPath.row]))
        return cell!
    }
    
    
}

