//
//  OnboardingViewControllerTests.swift
//  AuthenticationTests
//
//  Created by Pinto Junior, William James on 26/05/23.
//

import XCTest
@testable import Authentication

final class OnboardingViewControllerTests: XCTestCase {
    
    private var sut: OnboardingViewController!
    private var view: OnboardingViewSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()
        view = OnboardingViewSpy()
        sut = OnboardingViewController(view: view)

        sut.viewDidLoad()
    }

    override func tearDownWithError() throws {
        sut = nil
        view = nil
        try super.tearDownWithError()
    }
    
    func testViewType_WhenViewControllerLoaded_ShouldBeOnboardingViewProtocol() {
        XCTAssertTrue(sut.view is OnboardingViewProtocol, "View should be OnboardingViewProtocol type")
    }
}
