import UIKit

final class RegisterAgeViewController: UIViewController {
    // MARK: - Constraints
    private let registerAgeView: RegisterAgeViewProtocol

    // MARK: - Variables
    weak var delegate: AuthenticationCoordinatorProtocol?

    // MARK: - Init
    init(view: RegisterAgeViewProtocol = RegisterAgeView()) {
        registerAgeView = view
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func loadView() {
        view = registerAgeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
