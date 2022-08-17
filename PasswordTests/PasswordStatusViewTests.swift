//
//  PasswordStatusViewTests.swift
//  PasswordTests
//
//  Created by Jean Ricardo Cesca on 16/08/22.
//

import XCTest
@testable import Password

//_ShowCheckmarkOrReset_When_Validation_Is_Inline
class PasswordStatusViewTestsInline: XCTestCase {
    
    var statusView: PasswordStatusView!
    let validPassword = "12345678Aa!"
    let invalidPassword = "123aA!"
    
    override func setUp() {
        super.setUp()
        
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = true //inline
        statusView.shouldResetCriteria = false
    }
    
    /*
        if shouldResetCriteria {
            // Inline validation (✅ or ⚪️)
        } else {
            ...
        }
        */
    
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckImage)  // ✅
    }
    
    func testInvalidPassword() throws {
        statusView.updateDisplay(invalidPassword)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertFalse(statusView.lengthCriteriaView.isResetImage)  // ⚪️
    }
}

//_ShowCheckmarkOrRedX_When_Validation_Is_Loss_Of_Focus
class PasswordStatusViewTestsLossOfFocus: XCTestCase {
    
    var statusView: PasswordStatusView!
    let validPassword = "12345678Aa!"
    let invalidPassword = "123aA!"
    
    override func setUp() {
        super.setUp()
        
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = false
    }
    
    /*
        if shouldResetCriteria {
            // Inline validation (✅ or ⚪️)
        } else {
            ...
        }
        */
    
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckImage)
    }
    
    func testInvalidPassword() throws {
        statusView.updateDisplay(invalidPassword)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isXmarkImage)
    }
}

class PasswordStatusViewTests_Validate_Three_of_Four: XCTestCase {
    
    var statusView: PasswordStatusView!
    
    let twoOfFour = "12345678A"
    let threeOfFour = "12345678Aa"
    let fourOfFour = "12345678Aa!"
    
    override func setUp() {
        super.setUp()
        
        statusView = PasswordStatusView()
    }
    
    func testTwoOfFour() {
        XCTAssertFalse(statusView.validate(twoOfFour))
    }
    
    func testThreeOfFour() {
        XCTAssertTrue(statusView.validate(threeOfFour))
    }
    
    func testFoutOfFour() {
        XCTAssertTrue(statusView.validate(fourOfFour))
    }
}


