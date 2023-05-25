import UIKit
import Common

protocol AuthenticationCoordinatorProtocol: CoordinatorProtocol {
}

public final class AuthenticationCoordinator: AuthenticationCoordinatorProtocol {
    // MARK: - Constraints
    private let navigationController: UINavigationController

    // MARK: - Variables
    public weak var parentCoordinator: CoordinatorProtocol?
    
    // MARK: - Init
    public init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Methods
    public func start() {
        let onboardingVC = OnboardingViewController()
        onboardingVC.delegate = self
        navigationController.pushViewController(onboardingVC, animated: false)
    }
}
