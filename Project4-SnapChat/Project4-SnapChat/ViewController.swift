//
//  ViewController.swift
//  Project4-SnapChat
//
//  Created by shengyang_yu on 16/3/4.
//  Copyright © 2016年 yushengyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarHidden = true

        let story = UIStoryboard.init(name: "Main", bundle: NSBundle.mainBundle())
        
        let leftView = story.instantiateViewControllerWithIdentifier("ViewLeftController")
        let centerView = story.instantiateViewControllerWithIdentifier("ViewCenterController")
        let rightView = story.instantiateViewControllerWithIdentifier("ViewRightController")
        
        self.addChildViewController(leftView)
        self.mScrollView.addSubview(leftView.view)
        leftView.didMoveToParentViewController(self)
        
        self.addChildViewController(centerView)
        self.mScrollView.addSubview(centerView.view)
        centerView.didMoveToParentViewController(self)
        
        self.addChildViewController(rightView)
        self.mScrollView.addSubview(rightView.view)
        rightView.didMoveToParentViewController(self)
        
        let viewWidth = CGRectGetWidth(self.view.frame)
        let viewHeight = CGRectGetHeight(self.view.frame)
        
        var leftFrame: CGRect = leftView.view.frame
        leftFrame.origin.x = 0
        leftFrame.size.width = viewWidth
        leftFrame.size.height = viewHeight
        leftView.view.frame = leftFrame
        
        var centerFrame: CGRect = centerView.view.frame
        centerFrame.origin.x = viewWidth
        centerFrame.size.width = viewWidth
        centerFrame.size.height = viewHeight
        centerView.view.frame = centerFrame
        
        var rightFrame: CGRect = rightView.view.frame
        rightFrame.size.width = viewWidth
        rightFrame.size.height = viewHeight
        rightFrame.origin.x = 2*viewWidth
        rightView.view.frame = rightFrame
        
        self.mScrollView.contentSize = CGSizeMake(3*viewWidth, viewHeight)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

