import UIKit

protocol RegisterProgressStepProtocol where Self: UIView {
    func setCurrentStep()
}

final class RegisterProgressStep: UIView, RegisterProgressStepProtocol {
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
        backgroundColor = .disabledColor
        clipsToBounds = true
        layer.cornerRadius = 2
        
        buildConstraints()
    }
    
    // MARK: - Methods
    func setCurrentStep() {
        backgroundColor = .primaryColor
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 5)
        ])
    }
}
