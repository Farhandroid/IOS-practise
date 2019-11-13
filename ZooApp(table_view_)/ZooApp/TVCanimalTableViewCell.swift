//
//  TVCanimalTableViewCell.swift
//  ZooApp
//
//  Created by Advancer on 2019/11/12.
//  Copyright © 2019 Advancer. All rights reserved.
//

import UIKit

class TVCanimalTableViewCell: UITableViewCell {

    @IBOutlet weak var IVanimal: UIImageView!
    
    @IBOutlet weak var LabelAnimal: UILabel!
    
    @IBOutlet weak var TVanimalDescription: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func SetAnimal(animal:Animal){
          self.LabelAnimal.text = animal.name!
          self.TVanimalDescription.text = animal.des!
          self.IVanimal.image = UIImage(named:animal.image!)
      }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
