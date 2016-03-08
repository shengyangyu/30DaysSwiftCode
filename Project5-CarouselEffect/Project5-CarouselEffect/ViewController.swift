//
//  ViewController.swift
//  Project5-CarouselEffect
//
//  Created by shengyang_yu on 16/3/7.
//  Copyright © 2016年 yushengyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bImageVIew: UIImageView!
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    private var bClass = baseClass.createData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    private struct Storyboard {
        static let cellID = "mCollectionViewCell"
    }

}


extension ViewController: UICollectionViewDataSource {

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bClass.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Storyboard.cellID, forIndexPath: indexPath) as! mCollectionViewCell
        cell.baseC = self.bClass[indexPath.item]
        return cell
    }
}

