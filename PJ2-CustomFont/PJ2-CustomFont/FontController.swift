//
//  FontController.swift
//  PJ2-CustomFont
//
//  Created by Peter on 2018/7/31.
//  Copyright © 2018 Peter. All rights reserved.
//

import Foundation
import UIKit

class FontController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var tableView: UITableView?
    var button: UIButton?
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                "测试测试测试测试测试测试",
                "123",
                "Alex",
                "@@@@@@"]
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Zapfino", "Gaspar Regular"]
    var fontNum: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        fontNum = 0
        tableView = UITableView(frame: CGRect(x: UIScreen.main.bounds.origin.x, y: UIScreen.main.bounds.origin.y, width: width, height: height - 300))
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "FontCell")
        tableView?.dataSource = self
        tableView?.delegate = self
        self.view.addSubview(tableView!)
        
        button = UIButton(frame:CGRect(x: 172, y: height - 200, width: 70, height: 70))
        button?.layer.cornerRadius = 35
        button?.backgroundColor = .gray
        button?.setTitle("click", for: .normal)
        button?.addTarget(self, action: #selector(self.change), for: .touchDown)
        self.view.addSubview(button!)
    }
    
    @objc func change(){
        if(fontNum! < 4){
            fontNum = fontNum! + 1
        }else{
            fontNum = 0
        }
        print(fontNum!)
        tableView?.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontCell")
        cell?.textLabel?.font = UIFont.init(name: fontNames[fontNum!], size: 16)
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
    }
}
