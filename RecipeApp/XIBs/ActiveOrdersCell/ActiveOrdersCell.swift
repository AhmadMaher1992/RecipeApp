//
//  ActiveOrdersCell.swift
//  RecipeApp
//
//  Created by Ahmad Eisa on 27/03/2021.
//

import UIKit

class ActiveOrdersCell: UICollectionViewCell {
    @IBOutlet weak var mainImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
//        self.layer.cornerRadius = max(self.frame.size.width, self.frame.size.height) / 2
//        self.layer.borderWidth = 10
//        self.layer.borderColor = UIColor(red: 110.0/255.0, green: 80.0/255.0, blue: 140.0/255.0, alpha: 1.0).cgColor
    }

}
