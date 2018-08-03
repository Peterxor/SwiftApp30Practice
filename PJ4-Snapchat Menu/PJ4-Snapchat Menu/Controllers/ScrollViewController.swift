//
//  ScrollViewController.swift
//  PJ4-Snapchat Menu
//
//  Created by Peter on 2018/8/2.
//  Copyright © 2018 Peter. All rights reserved.
//

import Foundation
import UIKit

class ScrollViewController: UIViewController{
    var scrollView: UIScrollView?
    var leftView: TimerController?
    var rightView: FontController?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        scrollView?.contentSize = CGSize(width: 2 * self.view.frame.width, height: self.view.frame.height)
        
        self.view.addSubview(scrollView!)
        leftView = TimerController()
        rightView = FontController()
        
        self.addChildViewController(leftView!)
        self.addChildViewController(rightView!)
        
        self.scrollView?.addSubview((leftView?.view)!)
        self.scrollView?.addSubview((rightView?.view)!)
        
        self.leftView?.didMove(toParentViewController: self)
        self.rightView?.didMove(toParentViewController: self)
        
        var rightframe = rightView?.view.frame
        rightframe?.origin.x = self.view.frame.width
        self.rightView?.view.frame = rightframe!
    }
}
