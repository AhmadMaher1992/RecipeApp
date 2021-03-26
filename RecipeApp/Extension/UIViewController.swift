//
//  UIViewController.swift
//  RecipeApp
//
//  Created by Ahmad Eisa on 26/03/2021.
//




import UIKit

 let userDefaults = UserDefaults.standard

extension UIViewController {
    
    
    
       func presentViewController( storyboard: String , viewController: String){
        let storyboard = UIStoryboard.init(name: storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: viewController)
        vc.modalPresentationStyle = .fullScreen
        
       self.present(vc, animated: true, completion: nil)
    }
    
    func navigateViewController( storyboard: String , viewController: String){
        let storyboard = UIStoryboard.init(name: storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: viewController)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    func simpleAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
//
//    func showErrorMessage(message:String)  {
//        SVProgressHUD.showError(withStatus: message)
//    }
   
//    func saveToken(token:String) {
//        userDefaults.set(token, forKey: UserDefaultsConstants.userApiToken)
//        userDefaults.synchronize()
//       // SVProgressHUD.dismiss()
//    }
    
    func activeAgain()  {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled=true
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
//     func goToMainTab()  {
//
//        userDefaults.set(true, forKey: UserDefaultsConstants.isUserLogined)
//        userDefaults.synchronize()
//        navigationController?.popViewController(animated: true)
//
//    }
    
    func activeViewsIfNoData()  {
        DispatchQueue.main.async {
            
            self.view.isUserInteractionEnabled=true
        }
    }
    
    
    
}

@available(iOS 9.0, *)
extension UIViewController {
    public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}






