//
//  Food.swift
//  FoodApp
//
//  Created by Advancer on 2019/11/12.
//  Copyright © 2019 Advancer. All rights reserved.
//

import UIKit

class Food: NSObject {
    var name:String?
    var des:String?
    var image:String?
    init(name:String,des:String,image:String) {
        self.name = name
        self.des = des
        self.image = image
        
    }
}
