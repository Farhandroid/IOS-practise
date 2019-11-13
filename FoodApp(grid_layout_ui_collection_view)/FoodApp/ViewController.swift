//
//  ViewController.swift
//  FoodApp
//
//  Created by Advancer on 2019/11/12.
//  Copyright © 2019 Advancer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource{

    @IBOutlet weak var CVfood: UICollectionView!
    var listOfFoods = [Food]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFoodsFromPropertyList()
        // Do any additional setup after loading the view.
        
        CVfood.delegate=self
        CVfood.dataSource=self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfFoods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cellFood:CVCfood = collectionView.dequeueReusableCell(withReuseIdentifier: "CellForFood", for: indexPath) as! CVCfood
              cellFood.setFood(food: listOfFoods[indexPath.row])
             return cellFood
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showFoodDetails", sender: listOfFoods[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showFoodDetails" {
            if let dis =  segue.destination as? VCFoodDetailsViewController {
                if let food = sender as? Food {
                    dis.food = food
                }
            }
        }
    }

    func loadFoodsFromPropertyList(){
     let path = Bundle.main.path(forResource: "Foods", ofType: "plist")! as String
        let url = URL(fileURLWithPath: path)
        
        do{
            let data = try Data(contentsOf:url)
            let plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
            let dicArray = plist as! [[String:String]]
            for food in dicArray {
                print(food["Name"]!)
               listOfFoods.append(Food(name: food["Name"]!, des: food["Des"]!, image: food["Image"]!))
            }
        }catch{
            print("cannot read file")
        }
    }
    
    

}

