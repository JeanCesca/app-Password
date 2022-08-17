//
//  ViewControllerTests.swift
//  PasswordTests
//
//  Created by Jean Ricardo Cesca on 16/08/22.
//

import Foundation
import XCTest

@testable import Password

class ViewControllerTests_NewPassword_Validation: XCTestCase {
    
    var viewController: ViewController!
    let validPassword = "12345678Aa!"
    let invalidPassword = "123aA!"
    
    override func setUp() {
        super.setUp()
        
        viewController = ViewController()
    }
    
    func testEmptyPassword() throws {
        viewController.newPasswordText = ""
        viewController.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(viewController.newPasswordTextField.errorLabel.text!, "Enter your password")
    }
    
//    func testInvalidPassword() throws {
//        viewController.newPasswordText = ""
//        viewController.resetPasswordButtonTapped(sender: UIButton())
//
//        XCTAssertEqual(viewController.newPasswordTextField.errorLabel.text!, "Enter valid special chars (.,@:?!()$\\/#) with no spaces")
//    }

    func testCriteriaNotMet() throws {
        viewController.newPasswordText = invalidPassword
        viewController.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(viewController.newPasswordTextField.errorLabel.text!, "Your password must meet the requirements below")
    }

    func testValidPassword() throws {
        viewController.newPasswordText = validPassword
        viewController.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(viewController.newPasswordTextField.errorLabel.text!, "")
    }
}

class ViewControllerTests_Confirm_Password_Validation: XCTestCase {

    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let tooShort = "1234Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    func testEmptyPassword() throws {
        vc.confirmPasswordText = ""
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorLabel.text!, "Enter your password.")
    }
    
    func testPasswordsDoNotMatch() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = tooShort
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorLabel.text!, "Passwords do not match.")
    }

    func testPasswordsMatch() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = validPassword
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorLabel.text!, "")
    }
}

class ViewControllerTests_Show_Alert: XCTestCase {

    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let tooShort = "1234Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    func testShowSuccess() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = validPassword
        vc.resetPasswordButtonTapped(sender: UIButton())

        XCTAssertNotNil(vc.alert)
        XCTAssertEqual(vc.alert!.title, "Success") // Optional
    }

    func testShowError() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = tooShort
        vc.resetPasswordButtonTapped(sender: UIButton())

        XCTAssertNil(vc.alert)
    }
}
