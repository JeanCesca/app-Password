//
//  PasswordCriteria.swift
//  Password
//
//  Created by Jean Ricardo Cesca on 09/08/22.
//

import Foundation

struct PasswordCriteria {
    
    //MARK: - Handling 8-32 Characters (no space)
    static func lengthCriteriaMet(_ text: String) -> Bool {
        return text.count >= 8 && text.count <= 32
    }
    
    static func noSpaceCriteriaMet(_ text: String) -> Bool {
        return text.rangeOfCharacter(from: NSCharacterSet.whitespaces) == nil
    }
    
    static func lengthAndNoSpaceMet(_ text: String) -> Bool {
        return lengthCriteriaMet(text) && noSpaceCriteriaMet(text)
    }
    
    //MARK: - Uppercase letters
    static func uppercaseMet(_ text: String) -> Bool {
        return text.range(of: "[A-Z]+", options: .regularExpression) != nil
    }
    
    //MARK: - Lowercase letters
    static func lowercaseMet(_ text: String) -> Bool {
        return text.range(of: "[a-z]+", options: .regularExpression) != nil
    }
    
    //MARK: - Digit
    static func digitMet(_ text: String) -> Bool {
        return text.range(of: "[0-9]+", options: .regularExpression) != nil
    }
    
    //MARK: - Special Characters
    static func specialCharactersMet(_ text: String) -> Bool {
        return text.range(of: "[@:?!()$#,./\\\\]+", options: .regularExpression) != nil
    }
}
