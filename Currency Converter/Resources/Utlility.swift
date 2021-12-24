//
//  Utlility.swift
//  Currency Converter
//
//  Created by Preeteesh Remalli on 24/12/21.
//

import UIKit
class Utlitity{
    public static var shared = Utlitity()
    
    private init(){}
    
    func showAlert(error: String){
        DispatchQueue.main.async {
            var top = UIApplication.shared.keyWindow?.rootViewController
            
            while (true){
                if (top?.presentedViewController) != nil {
                    top = top?.presentedViewController
                }else if let nav = top as? UINavigationController {
                    top = nav.topViewController;
                }else if let tab = top as? UITabBarController {
                    top = tab.selectedViewController;
                }else{
                    break;
                }
            }
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            top?.present(alert, animated: true)
        }
        
    }
    
}
