//
//  LoginValidation.swift
//  WeatherApp
//
//  Created by M_AMBIN05376 on 24/02/22.
//

import Foundation
extension String {
    
    var isEmailVaild: Bool{
        let emailRegEx = "[A-Z0-9a-z._%+]+@[A-Za-z0-9.]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }
    
    var isPasswordValid: Bool{
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        
        return passwordTest.evaluate(with: self)
    }
}

