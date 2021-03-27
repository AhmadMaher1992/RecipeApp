//
//  RecipeCell.swift
//  RecipeApp
//
//  Created by Ahmad Eisa on 26/03/2021.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var favoriteImage: UIImageView!
    
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCardView()
      
    }

    func makeRounded() {

    
     
        favoriteImage.layer.borderColor = UIColor.black.cgColor
  
        favoriteImage.clipsToBounds = true
        }
    func setupCardView() {
        // The subview inside the collection view cell
        cardView.layer.cornerRadius = 20.0
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cardView.layer.shadowRadius = 5.0
        cardView.layer.shadowOpacity = 0.7
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
