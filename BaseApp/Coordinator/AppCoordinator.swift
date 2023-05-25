import UIKit
import Common
import Authentication

final class AppCoordinator: CoordinatorProtocol {
    // MARK: - Variables
    private var childCoordinators = [CoordinatorProtocol]()
    private var navigationController: UINavigationController

    // MARK: - Init
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Methods
    func start() {
        let authFlowCoordinator = AuthenticationCoordinator(navigationController: navigationController)
        childCoordinators.append(authFlowCoordinator)
        authFlowCoordinator.parentCoordinator = self
        authFlowCoordinator.start()
    }
}
