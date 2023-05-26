import UIKit

final class OnboardingViewController: UIViewController {
    // MARK: - Constraints
    private let onboardingView: OnboardingViewProtocol

    // MARK: - Variables
    weak var delegate: AuthenticationCoordinatorProtocol?

    // MARK: - Init
    init(view: OnboardingViewProtocol = OnboardingView()) {
        onboardingView = view
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func loadView() {
        view = onboardingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingView.loginButtonPressed = {
            print("AAA")
        }
    }
}
