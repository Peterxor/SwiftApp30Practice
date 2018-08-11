//
//  ViewController.swift
//  PJ9-ImageScroller
//
//  Created by Peter on 2018/8/9.
//  Copyright © 2018 Peter. All rights reserved.
//

import UIKit

class ImageScroller: UIViewController, UIScrollViewDelegate{
    var imageView: UIImageView?
    var scrollView: UIScrollView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(image: UIImage(named: "beach"))
        print("first image frame width: \(imageView?.frame.width)")
        print("first image bounds width: \(imageView?.bounds.width)")
        
        
        
        scrollView = UIScrollView(frame: self.view.bounds)
        scrollView?.contentSize = (imageView?.bounds.size)!
        scrollView?.backgroundColor = .black
        scrollView?.contentOffset = CGPoint(x: 0, y: 0)
        scrollView?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        scrollView?.delegate = self
        let minWidthScale = (scrollView?.bounds.width)! / (imageView?.bounds.width)!
        let minHeightScale = (scrollView?.bounds.height)! / (imageView?.bounds.height)!
        scrollView?.zoomScale = 1
        scrollView?.minimumZoomScale = min(minWidthScale, minHeightScale)
        print("minimumZoomScale: \(scrollView?.minimumZoomScale)")
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(self.tapZoom))
        doubleTap.numberOfTapsRequired = 2
        scrollView?.addGestureRecognizer(doubleTap)
        
        scrollView?.addSubview(imageView!)
        self.view.addSubview(scrollView!)
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let scrollViewWidth = scrollView.bounds.width
        let scrollViewHeight = scrollView.bounds.height
        let imageWidth = imageView?.frame.width
        let imageHeight = imageView?.frame.height
        print("image frame width: \(imageView?.frame.width)")
        print("image bounds width: \(imageView?.bounds.width)")
        
        let widthPadding = scrollViewWidth > imageWidth! ? (scrollViewWidth - imageWidth!)/2 : 0
        let heightPadding = scrollViewHeight > imageHeight! ? (scrollViewHeight - imageHeight!)/2 : 0
        scrollView.contentInset = UIEdgeInsets(top: heightPadding, left: widthPadding, bottom: heightPadding, right: widthPadding)
    }
    
    @objc func tapZoom(){
        if ((scrollView?.zoomScale)! > (scrollView?.minimumZoomScale)!) {
            scrollView?.setZoomScale((scrollView?.minimumZoomScale)!, animated: true)
        } else {
            scrollView?.setZoomScale((scrollView?.maximumZoomScale)!, animated: true)
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

