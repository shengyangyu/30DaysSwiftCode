//
//  ViewController.swift
//  Project7-PullRefresh
//
//  Created by shengyang_yu on 16/3/8.
//  Copyright © 2016年 yushengyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let cellID = "CellID"
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var emojiData = [String]()
    var tableVC = UITableViewController(style: .Plain)
    var refreshControl = UIRefreshControl()
    var navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 375, height: 64))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        emojiData = favoriteEmoji
        let emjioTableView = tableVC.tableView
        emjioTableView.backgroundColor = UIColor(red:0.092, green:0.096, blue:0.116, alpha:1)
        emjioTableView.dataSource = self
        emjioTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        tableVC.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: "didRoadEmoji", forControlEvents: .ValueChanged)
        self.refreshControl.backgroundColor = UIColor(red:0.113, green:0.113, blue:0.145, alpha:1)
        
        let attributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.refreshControl.attributedTitle = NSAttributedString(string: "Last updated on \(NSDate())", attributes: attributes)
        self.refreshControl.tintColor = UIColor.whiteColor()
        
        self.title = "emoji"
        self.navBar.barStyle = UIBarStyle.BlackTranslucent
        
        emjioTableView.rowHeight = UITableViewAutomaticDimension
        emjioTableView.estimatedRowHeight = 60.0
        emjioTableView.tableFooterView = UIView(frame: CGRectZero)
        emjioTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.view.addSubview(emjioTableView)
        self.view.addSubview(navBar)
    }
    // UITableView Delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return emojiData.count
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID)! as UITableViewCell
        cell.textLabel!.text = self.emojiData[indexPath.row]
        cell.textLabel!.textAlignment = NSTextAlignment.Center
        cell.textLabel!.font = UIFont.systemFontOfSize(50)
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    func didRoadEmoji() {
        self.emojiData = newFavoriteEmoji
        self.tableVC.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

