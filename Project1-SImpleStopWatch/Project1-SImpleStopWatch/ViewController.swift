//
//  ViewController.swift
//  Project1-SImpleStopWatch
//
//  Created by shengyang_yu on 16/3/3.
//  Copyright © 2016年 yushengyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var reserBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var counter = 0.0
    var timer = NSTimer()
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    @IBAction func startAction(sender: UIButton) {
        
        guard isPlaying else {
            startBtn.enabled = false
            pauseBtn.enabled = true
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
            isPlaying = true
            return;
        }
        
    }
    @IBAction func stopAction(sender: UIButton) {
        
        guard !isPlaying else {
            startBtn.enabled = true
            pauseBtn.enabled = false
            timer.invalidate()
            isPlaying = false
            return
        }
    }
    @IBAction func resetAction(sender: UIButton) {
        timer.invalidate()
        startBtn.enabled = true
        pauseBtn.enabled = true
        counter = 0
        timeLabel.text = String(format: "%.1f", counter)
        isPlaying = false
    }
    
    func updateTimer() {
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

