import XCTest
@testable import BaseApp

final class AppCoordinatorTests: XCTestCase {
    
    private var sut: AppCoordinator!
    private var navigationController: UINavigationControllerSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()
        navigationController = UINavigationControllerSpy()
        sut = AppCoordinator(navigationController: navigationController)
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
        try super.tearDownWithError()
    }

    func testStart_ShouldPushOnlyOnce() {
        sut.start()

        XCTAssertTrue(navigationController.pushCalled == 1, "The start() should push the view controller only once")
    }
    

}
