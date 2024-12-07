//
//  String+Extension.swift
//  AppLogin
//
//  Created by Marcos Vinícius Vieira on 07/12/24.
//

import Foundation
import UIKit

public enum ValidType {
    case email
    case passoword
}

extension String {
    
    enum Regex: String {
        case email = "[A-Z0-9a-z.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case passoword = ".{6,}"
    
    }
    
    func isValid(validType: ValidType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
            case .email:
            regex = Regex.email.rawValue
        case .passoword:
            regex = Regex.passoword.rawValue
        }
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
    
}
