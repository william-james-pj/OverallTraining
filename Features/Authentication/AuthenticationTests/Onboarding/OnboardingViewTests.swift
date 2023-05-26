//
//  OnboardingViewTests.swift
//  AuthenticationTests
//
//  Created by Pinto Junior, William James on 26/05/23.
//

import XCTest
@testable import Authentication

final class OnboardingViewTests: XCTestCase {

    private var sut: OnboardingViewProtocol!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = OnboardingView()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testLoginButtonAction_WhenLoginButtonPressed_LoginButtonPressedCountShouldBeOne() {
        let stackBase = sut.findByAccessibilityIdentifier(identifier: "stackBase") as? UIStackView
        let viewFooter = stackBase?.findByAccessibilityIdentifier(identifier: "viewFooter") as? UIView
        let stackFooter = viewFooter?.findByAccessibilityIdentifier(identifier: "stackFooter") as? UIStackView
        let loginButton = stackFooter?.findByAccessibilityIdentifier(identifier: "buttonLogin") as? UIButton
        
        var loginButtonPressedCount = 0
        sut.loginButtonPressed = {
            loginButtonPressedCount += 1
        }
        
        loginButton?.sendActions(for: .touchUpInside)
        
        XCTAssertEqual(loginButtonPressedCount, 1, "Button pressed count should be 1")
    }
    
    func testRegisterButtonAction_WhenRegisterButtonPressed_RegisterButtonPressedCountShouldBeOne() {
        let stackBase = sut.findByAccessibilityIdentifier(identifier: "stackBase") as? UIStackView
        let viewFooter = stackBase?.findByAccessibilityIdentifier(identifier: "viewFooter") as? UIView
        let stackFooter = viewFooter?.findByAccessibilityIdentifier(identifier: "stackFooter") as? UIStackView
        let registerButton = stackFooter?.findByAccessibilityIdentifier(identifier: "buttonRegister") as? UIButton
        
        var registerButtonPressedCount = 0
        sut.registerButtonPressed = {
            registerButtonPressedCount += 1
        }
        
        registerButton?.sendActions(for: .touchUpInside)
        
        XCTAssertNotNil(registerButton)
        XCTAssertEqual(registerButtonPressedCount, 1, "Button pressed count should be 1")
    }
}
