//
//  ViewController.swift
//  Project3-PlayLocalVideo
//
//  Created by shengyang_yu on 16/3/4.
//  Copyright © 2016年 yushengyang. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var videoTable: UITableView!
    
    var data = [video(image: "videoScreenshot01", name: "Introduce 3DS Mario", origin: "Youtube - 06:32"),
        video(image: "videoScreenshot02", name: "Emoji Among Us", origin: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", name: "Seals Documentary", origin: "Vine - 00:06"),
        video(image: "videoScreenshot04", name: "Adventure Time", origin: "Youtube - 02:39"),
        video(image: "videoScreenshot05", name: "Facebook HQ", origin: "Facebook - 10:20"),
        video(image: "videoScreenshot06", name: "Lijiang Lugu Lake", origin: "Allen - 20:30")]
    
    var playViewController = AVPlayerViewController()
    var player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        videoTable.delegate = self
        videoTable.dataSource = self
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220.0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = videoTable.dequeueReusableCellWithIdentifier("videoCell", forIndexPath: indexPath) as! VideoCell
        let video = data[indexPath.row]
        
        cell.videoImage.image = UIImage(named: video.image)
        cell.vide0Name.text = String(video.name)
        cell.videoOrigin.text = String(video.origin)
        
        
        return cell;
    }
    
    @IBAction func startAction(sender: UIButton) {
        
        let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
        player = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        playViewController.player = player
        self.presentViewController(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

