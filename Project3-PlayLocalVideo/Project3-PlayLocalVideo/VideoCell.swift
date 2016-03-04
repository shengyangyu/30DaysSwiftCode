//
//  VideoCell.swift
//  Project3-PlayLocalVideo
//
//  Created by shengyang_yu on 16/3/4.
//  Copyright © 2016年 yushengyang. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let name: String
    let origin: String
}


class VideoCell: UITableViewCell {

    
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoOrigin: UILabel!
    @IBOutlet weak var vide0Name: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
