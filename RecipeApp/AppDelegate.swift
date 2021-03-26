//
//  AppDelegate.swift
//  RecipeApp
//
//  Created by Ahmad Eisa on 25/03/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        transperantTabBar()
        navBarSetup()
        return true
    }
    
    func transperantTabBar(){
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.8980392157, green: 0.5568627451, blue: 0.1490196078, alpha: 1)
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().barTintColor = UIColor.clear

    }
    
    func navBarSetup(){
        // Sets background to a blank/empty image
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default )
        // Sets shadow (line below the bar) to a blank image
        UINavigationBar.appearance().shadowImage = UIImage()
        //Remove Back KeyWord
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000.0, vertical: 0.0), for: .default)
        // Title text color Black => Text appears in white
        UINavigationBar.appearance().barStyle = .black
        
        
        
        // Foreground color of bar button item text, e.g. "< Back", "Done", and so on.
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //        // BACKGROUND color of nav bar
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().clipsToBounds = false
        //        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }


}

