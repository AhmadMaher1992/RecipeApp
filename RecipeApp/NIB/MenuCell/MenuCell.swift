//
//  MenuCell.swift
//  RecipeApp
//
//  Created by Ahmad Eisa on 26/03/2021.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var backView: UIViewX!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.alpha = 0.6
        titleLabel.font = UIFont(name: AppFonts.DelaGothic, size: 15)
        
    }
    
    func setupCell(text: String) {
        titleLabel.text = text
    }
    //Determine What happen when you select this cell
 
   // UIColor(red: 234, green: 181, blue: 67, alpha: 0.3)
    override var isSelected: Bool {
        didSet{
            self.backView.backgroundColor = isSelected ? #colorLiteral(red: 0.9176470588, green: 0.7098039216, blue: 0.262745098, alpha: 0.3121103405) : .white
            
          
        }
    }
    
    
    
    
    
    
}
