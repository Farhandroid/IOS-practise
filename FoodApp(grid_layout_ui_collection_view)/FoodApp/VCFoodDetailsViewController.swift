//
//  VCFoodDetailsViewController.swift
//  FoodApp
//
//  Created by Advancer on 2019/11/12.
//  Copyright © 2019 Advancer. All rights reserved.
//

import UIKit

class VCFoodDetailsViewController: UIViewController {
    
    @IBOutlet weak var LabelFood: UILabel!
    @IBOutlet weak var IVFood: UIImageView!
    @IBOutlet weak var navbarBackBTN: UIBarButtonItem!
    @IBOutlet weak var TVFoodDesc: UITextView!
    var food:Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LabelFood.text = food?.name!
        TVFoodDesc.text = food?.des!
        IVFood.image = UIImage(named: (food?.image!)!)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func navbarBackBTN(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
