//
//  PasswordCriteriaTests.swift
//  PasswordTests
//
//  Created by Jean Ricardo Cesca on 16/08/22.
//

import Foundation
import XCTest
@testable import Password

class PasswordLengthCriteriaTests: XCTestCase {
    
    //Teste: menos que 8 caracteres
    func testShort() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("1234567"))
    }
    
    //Teste: mais que 32 caracteres
    func testLong() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("123456789012345678901234567890123"))
    }
    
    func testValidShort() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678"))
    }
    
    func testValidLong() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678901234567890123456789012"))
    }
}

class PasswordOtherCriteriaTests: XCTestCase {
    
    //noSpaceCriteriaMet
    func testSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("abc"))
    }
    
    func testSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.noSpaceCriteriaMet("a bc"))
    }
    
    //lengthAndNoSpaceMet
    func testLengthAndNoSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.lengthAndNoSpaceMet("12345678"))
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet("1234567 8"))
    }

    
    //UpperAndLowerCase
    func testCaseMet() throws {
        XCTAssertTrue(PasswordCriteria.uppercaseMet("J"))
        XCTAssertTrue(PasswordCriteria.lowercaseMet("j"))
    }
    
    func testDigitMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("2"))
    }
    
    func testSpecialCharactersMet() throws {
        XCTAssertTrue(PasswordCriteria.specialCharactersMet("!@#%"))
    }
}




