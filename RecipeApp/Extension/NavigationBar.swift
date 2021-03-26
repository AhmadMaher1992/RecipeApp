//
//  NavigationBar.swift
//  RecipeApp
//
//  Created by Ahmad Eisa on 25/03/2021.
//


import UIKit
extension UIViewController {


    open func showNavigationBar(_ large: Bool,
                                _ animated: Bool,
                                titleColor: UIColor,
                                barTintColor: UIColor,
                                fontSize: CGFloat) {

        navigationController?.navigationBar.barTintColor = barTintColor
        navigationController?.navigationBar.backgroundColor = barTintColor
        navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        if large {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            if #available(iOS 13.0, *) {
                let appearance = UINavigationBarAppearance()
                appearance.backgroundColor = barTintColor
                appearance.titleTextAttributes = [.foregroundColor: titleColor]
                appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor,
                                                       NSAttributedString.Key.font: UIFont(name: AppFonts.DelaGothic, size: 22)! ]

                navigationController?.navigationBar.standardAppearance = appearance
                navigationController?.navigationBar.compactAppearance = appearance
                navigationController?.navigationBar.scrollEdgeAppearance = appearance
            } else {
                self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor,
                                                                                     NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
            }
        } else {
            self.navigationController?.navigationBar.prefersLargeTitles = false
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor,
                                                                            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
        }
    }
}

