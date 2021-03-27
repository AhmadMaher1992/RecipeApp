//
//  OrderDetailsVC.swift
//  RecipeApp
//
//  Created by Ahmad Eisa on 26/03/2021.
//

import UIKit

class OrderDetailsVC: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.font = UIFont(name: AppFonts.DelaGothic, size: 20)
        }
    }
    
    
    @IBOutlet weak var downOrangeView: UIView!
    @IBOutlet weak var downWhiteView: UIView!
    
    @IBOutlet weak var oderBtn: UIButtonX!
    //TODO:- it should be Array of models
    let countriesArray = [[" aa", "  af ", "Korea"],
                          ["fcvf", "vv", "vvv"],
                          ["vxv", "vxz", "xva"],
                          ["Spafgfsgin", " fsv las", "Frgfsdance"]]
    
    let menuTitles = ["Active Orders", "Fast Order"]
    
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
    
    
    //MARK:- Collectionview Set up
    fileprivate var items = [Character]()
    fileprivate var currentPage: Int = 0 {
        didSet {
            let character = self.items[self.currentPage]
            self.infoLabel.text = character.name.uppercased()
            self.detailLabel.text = character.movie.uppercased()
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            let layout = UPCarouselFlowLayout()
            layout.itemSize = CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
            layout.scrollDirection = .horizontal
            collectionView.collectionViewLayout = layout
            collectionView.dataSource = self
            collectionView.delegate = self
            //   collectionView.isPagingEnabled = true
            collectionView.register(UINib(nibName: AppCellIdentifier.ActiveOrdersCell, bundle: nil), forCellWithReuseIdentifier: AppCellIdentifier.ActiveOrdersCell)
        }
    }
    
    fileprivate var pageSize: CGSize {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    fileprivate var orientation: UIDeviceOrientation {
        return UIDevice.current.orientation
    }
    
    
    // ----------------------------------------------------
    //MARK:- View Controller Life Cycle
    // ----------------------------------------------------
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuCollectionExtraSetup()
        //  addSwipeGesture()
        setupCollectionView()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
        
    }
    
    
    // ----------------------------------------------------
    //MARK:- Collection View Set Up
    // ----------------------------------------------------
    func setupCollectionView(){
        self.setupLayout()
        self.items = self.createItems()
        
        self.currentPage = 0
        
        NotificationCenter.default.addObserver(self, selector: #selector(OrderDetailsVC.rotationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    fileprivate func setupLayout() {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 30)
    }
    
    fileprivate func createItems() -> [Character] {
        let characters = [
            Character(imageName: "burger0", name: "burger0", movie: "burger0"),
            Character(imageName: "burger1", name: "burger1", movie: "burger1"),
            Character(imageName: "burger2", name: "burger2", movie: "burger2"),
            Character(imageName: "burger4", name: "burger4", movie: "burger4"),
            Character(imageName: "burger5", name: "burger5", movie: "burger5"),
            Character(imageName: "burger6", name: "burger6", movie: "burger6"),
            Character(imageName: "burger7", name: "burger7", movie: "burger7")
        ]
        return characters
    }
    
    @objc fileprivate func rotationDidChange() {
        guard !orientation.isFlat else { return }
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        let direction: UICollectionView.ScrollDirection = orientation.isPortrait ? .horizontal : .vertical
        layout.scrollDirection = direction
        if currentPage > 0 {
            let indexPath = IndexPath(item: currentPage, section: 0)
            let scrollPosition: UICollectionView.ScrollPosition = orientation.isPortrait ? .centeredHorizontally : .centeredVertically
            self.collectionView.scrollToItem(at: indexPath, at: scrollPosition, animated: false)
        }
    }
    
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
    
    
    
    
    func menuCollectionExtraSetup(){
        selectedArray = countriesArray[selectedIndex]
        menuCollection.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .centeredVertically)
        //   menuCollection.isScrollEnabled = false
        indicatorView.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        indicatorView.frame = CGRect(x: menuCollection.bounds.minX + 50 , y: menuCollection.bounds.maxY - indicatorHeight - 8, width: 30 , height: indicatorHeight)
        
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
        collectionView.reloadData()
        
        let desiredX = (self.view.bounds.width / CGFloat(menuTitles.count)) * CGFloat(selectedIndex)
        
        UIView.animate(withDuration: 0.3) {
            self.indicatorView.frame = CGRect(x: desiredX + 60 , y: self.menuCollection.bounds.maxY - self.indicatorHeight - 8 , width: 30, height: self.indicatorHeight)
        }
    }
    
    
    @IBAction func orderBtnClicked(_ sender: Any) {
    }
    
}


// ----------------------------------------------------
//MARK:- HomeVC Collection View Delegate Methods
// ----------------------------------------------------

extension OrderDetailsVC: UICollectionViewDelegate , UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.menuCollection {
            return menuTitles.count
        }
        if collectionView == self.collectionView {
            return items.count - 1
        }
        
        return 0
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.menuCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppCellIdentifier.MenuCell, for: indexPath) as! MenuCell
            cell.setupCell(text: menuTitles[indexPath.item])
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppCellIdentifier.ActiveOrdersCell, for: indexPath) as! ActiveOrdersCell
            let character = items[(indexPath as NSIndexPath).row]
            cell.mainImg.image = UIImage(named: character.imageName)
            return cell
            
            
        }
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.menuCollection {
            selectedIndex = indexPath.item
            refreshContent()
        }
        
        if collectionView == self.collectionView {
            let character = items[(indexPath as NSIndexPath).row]
            let alert = UIAlertController(title: character.name, message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        
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
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    //        if collectionView == self.menuCollection {
    //           return UIEdgeInsets(top: 0, left: 0, bottom: 0, right:10)
    //        }
    //        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right:0)
    //    }
    
}


extension OrderDetailsVC: UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.menuCollection {
            
            return CGSize(width: self.view.frame.width / CGFloat(menuTitles.count), height: collectionView.bounds.height)
        }
        else if collectionView == self.collectionView {
            return CGSize(width: collectionView.bounds.width , height: collectionView.bounds.height)
        }
        //        else if collectionView == self.collectionView{
        //            switch indexPath.item {
        //            case 1:
        //                return CGSize(width: 200, height: 200)
        //            case 2:
        //                return CGSize(width: 150, height: 150)
        //            case 3:
        //                return CGSize(width: 100 , height: 100)
        //            default:
        //            break
        //
        //            }
        //
        //        }
        return CGSize(width: 50, height:50)
    }
}



