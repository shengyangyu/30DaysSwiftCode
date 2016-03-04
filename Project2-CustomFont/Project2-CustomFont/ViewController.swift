//
//  ViewController.swift
//  Project2-CustomFont
//
//  Created by shengyang_yu on 16/3/4.
//  Copyright © 2016年 yushengyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉"]
    var fontNames = ["Gaspar", "MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    var fontRowIndex = 0
    
    
    @IBOutlet weak var fontTable: UITableView!
    @IBOutlet weak var fontBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fontTable.delegate = self
        fontTable.dataSource = self
        fontBtn.layer.cornerRadius = 40.0
        
        for fontName in UIFont.familyNames() {
            for font in UIFont.fontNamesForFamilyName(fontName) {
                print(font)
            }
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return  .LightContent;
    }
    
    // MARK  tableView
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return  1;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  data.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = fontTable.dequeueReusableCellWithIdentifier("fontCell", forIndexPath: indexPath)
        
        let text = data[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.redColor()
        cell.textLabel?.font = UIFont(name: fontNames[fontRowIndex], size: 18)
        
        return  cell;
        
    }

    @IBAction func changeFontAction(sender: UIButton) {
        fontRowIndex = (fontRowIndex+1) % fontNames.count
        fontTable.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

