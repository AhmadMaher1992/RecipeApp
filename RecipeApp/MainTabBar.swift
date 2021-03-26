//
//  ViewController.swift
//  RecipeApp
//
//  Created by Ahmad Eisa on 25/03/2021.
//

import UIKit

class MainTabBar: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRounTB()
    }
    
    
    
    func makeRounTB(){
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 30, y: tabBar.bounds.minY - 5, width: tabBar.bounds.width - 60, height: tabBar.bounds.height + 10), cornerRadius: (tabBar.frame.width/2)).cgPath
        // Shadow Color and Radius
       layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
       layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
      layer.shadowOpacity = 1.0
      layer.shadowRadius = 5.0
     layer.masksToBounds = false
      layer.cornerRadius = 4.0
        layer.fillColor = AppColors.tabBarColor
        tabBar.layer.insertSublayer(layer, at: 0)
        
        if let items = tabBar.items {
            items.forEach { item in
                item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15, right: 0)
            }
        }
        
        tabBar.itemWidth = 50
        tabBar.itemPositioning = .centered
   
    }
    
}

