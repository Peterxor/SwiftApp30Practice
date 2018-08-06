//
//  CollectionCell.swift
//  PJ5-CarouselEffect
//
//  Created by Peter on 2018/8/4.
//  Copyright © 2018 Peter. All rights reserved.
//

import Foundation
import UIKit

class CollectionCell: UICollectionViewCell{
    var imageView: UIImageView?
    
    func setCellImage(image: String){
        let picture = UIImage.init(named: image)
        imageView = UIImageView.init(image: picture)
        
        self.addSubview(imageView!)
    }
}
