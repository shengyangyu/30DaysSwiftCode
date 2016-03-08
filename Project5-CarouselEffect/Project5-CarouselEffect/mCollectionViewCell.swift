//
//  mCollectionViewCell.swift
//  Project5-CarouselEffect
//
//  Created by shengyang_yu on 16/3/8.
//  Copyright © 2016年 yushengyang. All rights reserved.
//

import UIKit

class mCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var bImageView: UIImageView!
    
    var baseC: baseClass! {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        mTitle.text = baseC.title
        bImageView.image = baseC.mImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
