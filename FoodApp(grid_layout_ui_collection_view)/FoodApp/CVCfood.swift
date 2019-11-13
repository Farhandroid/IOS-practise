//
//  CVCfood.swift
//  FoodApp
//
//  Created by Advancer on 2019/11/12.
//  Copyright © 2019 Advancer. All rights reserved.
//

import UIKit

class CVCfood: UICollectionViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    
    
    @IBOutlet weak var foodLabel: UILabel!
    
    func setFood(food:Food){
        foodImage.image = UIImage(named: food.image!)
        foodLabel.text = food.name!
    }
}
