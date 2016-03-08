//
//  ViewController.swift
//  Project9-ImageScroller
//
//  Created by shengyang_yu on 16/3/8.
//  Copyright © 2016年 yushengyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var mImageView: UIImageView!
    var mScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mImageView = UIImageView(image: UIImage(named: "steve"))
        setUpScrollView()
        mScrollView.delegate = self
        setZoomScaleFor(mScrollView.bounds.size)
        mScrollView.zoomScale = mScrollView.minimumZoomScale
        reCenterImage()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        view.bringSubviewToFront(mScrollView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setZoomScaleFor(mScrollView.bounds.size)
        if mScrollView.zoomScale < mScrollView.minimumZoomScale {
            mScrollView.zoomScale = mScrollView.minimumZoomScale
        }
        reCenterImage()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // scrollView
    private func setUpScrollView() {
        print(NSStringFromCGRect(view.bounds))
        mScrollView = UIScrollView(frame: view.bounds)
        mScrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        mScrollView.backgroundColor = UIColor.clearColor()
        mScrollView.contentSize = mImageView.bounds.size
        mScrollView.addSubview(mImageView)
        view.addSubview(mScrollView)
    }
    private func setZoomScaleFor(scrollViewSize: CGSize) {
        let imageSize = mImageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let minimunScale = min(widthScale, heightScale)
        
        mScrollView.minimumZoomScale = minimunScale
        mScrollView.maximumZoomScale = 3.0
    }
    private func reCenterImage() {
        let scrollSize = mScrollView.bounds.size
        let imageSize = mImageView.bounds.size
        let hSpace = imageSize.width < scrollSize.width ? (scrollSize.width - imageSize.width) / 2.0 : 0
        let vSpace = imageSize.height < scrollSize.height ? (scrollSize.height - imageSize.height) / 2.0 : 0
        mScrollView.contentInset = UIEdgeInsetsMake(vSpace, hSpace, vSpace, hSpace)
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.mImageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        self.reCenterImage()
    }
}

