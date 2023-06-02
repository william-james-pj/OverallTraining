import UIKit

protocol RegisterAgeViewProtocol where Self: UIView {
}

final class RegisterAgeView: UIView, RegisterAgeViewProtocol {
    // MARK: - Constraints
    // MARK: - Variables
    // MARK: - Components
    private let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let stackContent: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        return stack
    }()
    
    private let viewContent: UIView = {
        let view = UIView()
        return view
    }()
    
    private let viewRegisterProgress: RegisterProgressProtocol = {
        let view = RegisterProgress()
        view.setSteps(steps: 5, currentStep: 1)
        return view
    }()
    
    private let viewRegisterFooter = RegisterFooter()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupView() {
        backgroundColor = .backgroundColor
        
        buildHierarchy()
        buildConstraints()
    }
    
    // MARK: - Methods
    private func buildHierarchy() {
        addSubview(stackBase)
        stackBase.addArrangedSubview(viewRegisterProgress)
        stackBase.addArrangedSubview(viewContent)
        stackBase.addArrangedSubview(viewRegisterFooter)
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([            
            stackBase.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            stackBase.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
