//
//  Alert.swift
//  WeatherApp
//
//  Created by M_AMBIN05376 on 24/02/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func displayMyAlertMessage(_ userMessage:String){
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title:"Okay", style:UIAlertAction.Style.default, handler:nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated:true, completion:nil)
    }
    
    
    func alertForLoginButton(_ userMessage:String){
        
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        //Dismiss to login page after signing up
        myAlert.addAction(UIAlertAction(title:"Proceed", style: .default, handler: { action in
            
            //self.performSegue(withIdentifier: "navigateToLogin", sender: nil)//
        }))
        self.present(myAlert, animated:true, completion:nil)
    }
    
    
}

