//
//  baseClass.swift
//  Project5-CarouselEffect
//
//  Created by shengyang_yu on 16/3/8.
//  Copyright © 2016年 yushengyang. All rights reserved.
//

import UIKit

class baseClass {
    
    var title = ""
    var descrption = ""
    var numberMembers = 0
    var numberPosts = 0
    var mImage: UIImage!
    
    init(title: String, descrption: String, mImage: UIImage!) {
        self.title = title
        self.descrption = descrption
        self.mImage = mImage
        numberMembers = 1
        numberPosts = 1
    }
    
    static func createData() -> [baseClass] {
    
        return [
            baseClass(title: "Hello there, i miss u.", descrption: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", mImage: UIImage(named: "hello")!),
            baseClass(title: "🐳🐳🐳🐳🐳", descrption: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", mImage: UIImage(named: "dudu")!),
            baseClass(title: "Training like this, #bodyline", descrption: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", mImage: UIImage(named: "bodyline")!),
            baseClass(title: "I'm hungry, indeed.", descrption: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", mImage: UIImage(named: "wave")!),
            baseClass(title: "Dark Varder, #emoji", descrption: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", mImage: UIImage(named: "darkvarder")!),
            baseClass(title: "I have no idea, bitch", descrption: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", mImage: UIImage(named: "hhhhh")!),
        ]
    }

}
