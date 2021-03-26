//
//  File.swift
//  RecipeApp
//
//  Created by Ahmad Eisa on 26/03/2021.
//

import UIKit

class FavoriteVC: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.separatorStyle = .none
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: AppCellIdentifier.FavoriteCell, bundle: nil), forCellReuseIdentifier: AppCellIdentifier.FavoriteCell)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.font = UIFont(name: AppFonts.DelaGothic, size: 20)
        
    }
    
    @IBAction func cartClicked(_ sender: Any) {
    }
    
    
    @IBAction func dismissClicked(_ sender: Any) {
    }
    
}


extension FavoriteVC: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard  let cell = tableView.dequeueReusableCell(withIdentifier: AppCellIdentifier.FavoriteCell, for: indexPath) as? FavoriteCell else { return UITableViewCell()}
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
}
