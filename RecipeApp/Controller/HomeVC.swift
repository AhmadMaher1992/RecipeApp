//
//  HomeVC.swift
//  RecipeApp
//
//  Created by Ahmad Eisa on 25/03/2021.
//

import UIKit

class HomeVC: UIViewController {
    
    let countriesArray = [["China", "Japan", "Korea"],
                          ["Egypt", "Sudan", "South Africa"],
                          ["Spain", "Netherlands", "France"],
                          ["Spain", "Netherlands", "France"]]
    
    let menuTitles = ["Burger", "Pizza", "Pasta" , "Salad"]
    
    var selectedArray = [String]()
    var selectedIndex = 0
    //First Selected
    var selectedIndexPath = IndexPath(item: 0, section: 0)
    var indicatorView = UIView()
    let indicatorHeight : CGFloat = 3
    
    
    @IBOutlet weak var menuCollection: UICollectionView!{
        didSet{
            menuCollection.dataSource = self
            menuCollection.delegate = self
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!{
        didSet{
            
            searchBar.backgroundColor = UIColor.clear
            searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
            searchBar.tintColor = UIColor.clear
            searchBar.isTranslucent = true
            searchBar.placeholder = "Type To Search SomeThing"
            searchBar.barTintColor = .gray
            searchBar.setImage(UIImage(named: "search"), for: .search, state: .normal)
            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor.init(red: 230, green: 230, blue: 230, alpha: 1)
        }
    }
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.separatorStyle = .none
            tableView.dataSource = self
            tableView.delegate = self 
            tableView.register(UINib(nibName: AppCellIdentifier.RecipeCell, bundle: nil), forCellReuseIdentifier: AppCellIdentifier.RecipeCell)
            
        }
    }
    @IBOutlet weak var titleLbl: UILabel!{
        didSet{
            let attributedText = NSMutableAttributedString(string: "Houze Cheese \n", attributes: [.foregroundColor: UIColor.black, .font: UIFont(name: AppFonts.DelaGothic, size: 25)!])
            attributedText.append(NSAttributedString(string: "Burger", attributes: [.foregroundColor: UIColor.black,.font: UIFont(name: AppFonts.DelaGothic, size: 25)! ]))
            titleLbl.attributedText = attributedText
            titleLbl.numberOfLines = 0
            titleLbl.textAlignment = .left
        }
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedArray = countriesArray[selectedIndex]
        menuCollection.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .centeredVertically)
        
        
        addSwipeGesture()
        
        indicatorView.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        indicatorView.frame = CGRect(x: menuCollection.bounds.minX + 28 , y: menuCollection.bounds.maxY - indicatorHeight - 8, width: 30 , height: indicatorHeight)
        menuCollection.addSubview(indicatorView)
        
    }
    
    //Add Swipe gesture To Our View right And Left
    func addSwipeGesture(){
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    
    @objc
    func swipeAction(_ sender: UISwipeGestureRecognizer) {
        //every time you swipe left you should increase index with 1
        if sender.direction == .left {
            if selectedIndex < menuTitles.count - 1 {
                selectedIndex += 1
            }
        } else {
            if selectedIndex > 0 {
                selectedIndex -= 1
            }
        }
        
        selectedIndexPath = IndexPath(item: selectedIndex, section: 0)
        menuCollection.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .centeredVertically)
        refreshContent()
    }
    
    
    func refreshContent(){
        selectedArray = countriesArray[selectedIndex]
        tableView.reloadData()
        
        let desiredX = (menuCollection.bounds.width / CGFloat(menuTitles.count)) * CGFloat(selectedIndex)
        
        UIView.animate(withDuration: 0.3) {
            self.indicatorView.frame = CGRect(x: desiredX + 35 , y: self.menuCollection.bounds.maxY - self.indicatorHeight - 8 , width: 30, height: self.indicatorHeight)
        }
    }
    
    @IBAction func menuBtnClicked(_ sender: Any) {
    }
    
    
    @IBAction func shoppingBtnClicked(_ sender: Any) {
        navigateViewController( storyboard: AppStoryboards.Main  , viewController: AppViewControllerID.CartVC)
    }
}



// ----------------------------------------------------
//MARK:- HomeVC table View Delegate Methods
// ----------------------------------------------------
extension HomeVC : UITableViewDataSource , UITableViewDelegate  {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppCellIdentifier.RecipeCell, for: indexPath) as? RecipeCell else { return UITableViewCell()}
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
    
}


// ----------------------------------------------------
//MARK:- HomeVC Collection View Delegate Methods
// ----------------------------------------------------

extension HomeVC: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppCellIdentifier.MenuCell, for: indexPath) as! MenuCell
        cell.setupCell(text: menuTitles[indexPath.item])
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        refreshContent()
        
        //        switch indexPath.item {
        //        case 0:
        //
        //        case 1:
        //
        //        case 2:
        //
        //        case 3:
        //
        //        case 4:
        //
        //        case 5:
        //
        //        default:
        //        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right:10)
    }
    
}


extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / CGFloat(menuTitles.count), height: collectionView.bounds.height)
    }
}
