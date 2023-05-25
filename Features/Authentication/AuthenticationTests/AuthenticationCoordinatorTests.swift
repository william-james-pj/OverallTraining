import XCTest
@testable import Authentication

final class AuthenticationCoordinatorTests: XCTestCase {
    
    private var sut: AuthenticationCoordinator!
    private var navigationController: UINavigationControllerSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        navigationController = UINavigationControllerSpy()
        sut = AuthenticationCoordinator(navigationController: navigationController)
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
        
        try super.tearDownWithError()
    }
    
    func testStart_ShouldPushOnboardingVC() {
        sut.start()

        XCTAssertTrue(navigationController.currentViewController is OnboardingViewController, "The current view controller should be OnboardingViewController")
        XCTAssertTrue(navigationController.pushCalled == 1, "The start() should push the view controller only once")
    }

}
