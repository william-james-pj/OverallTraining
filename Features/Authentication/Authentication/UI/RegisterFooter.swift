import UIKit

protocol RegisterFooterProtocol where Self: UIView {
    var previousButtonPressed: (() -> Void)? { get set }
    var continueButtonPressed: (() -> Void)? { get set }
}

final class RegisterFooter: UIView {
    // MARK: - Variables
    var previousButtonPressed: (() -> Void)?
    var continueButtonPressed: (() -> Void)?
    
    // MARK: - Components
    private let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let viewStackAux = UIView()
    
    private let stackButton: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let buttonPrevious: UIButton = {
        var config = UIButton.Configuration.plain()
        config.titleAlignment = .center
        config.baseForegroundColor = .white
        config.buttonSize = .small
        config.image = UIImage(systemName: "chevron.left",
          withConfiguration: UIImage.SymbolConfiguration(scale: .small))
        config.imagePadding = 8.0
        
        var container = AttributeContainer()
        container.font = .systemFont(ofSize: 14, weight: .semibold)
        config.attributedTitle = AttributedString("Anterior", attributes: container)
        
        let button = UIButton()
        button.configuration = config
        button.accessibilityIdentifier = "buttonPrevious"
        return button
    }()
    
    private let buttonContinue: UIButton = {
        var config = UIButton.Configuration.filled()
        config.titleAlignment = .center
        config.baseBackgroundColor = .cardColor
        config.baseForegroundColor = .textColor
        config.buttonSize = .large
        config.image = UIImage(systemName: "chevron.right.2",
          withConfiguration: UIImage.SymbolConfiguration(scale: .small))
        config.imagePlacement = .trailing
        config.imagePadding = 8.0

        var container = AttributeContainer()
        container.font = .systemFont(ofSize: 16, weight: .bold)
        container.font = .systemFont(ofSize: 14, weight: .semibold)
        config.attributedTitle = AttributedString("Continuar", attributes: container)

        let button = UIButton()
        button.configuration = config
        button.accessibilityIdentifier = "buttonContinue"
        return button
    }()
    
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
        backgroundColor = .primaryColor
        
        setupActions()
        buildHierarchy()
        buildConstraints()
    }
    
    private func setupActions() {
        buttonPrevious.addTarget(self, action: #selector(previousButtonAction), for: .touchUpInside)
        buttonContinue.addTarget(self, action: #selector(continueButtonAction), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func previousButtonAction() {
        previousButtonPressed?()
    }
    
    @objc private func continueButtonAction() {
        continueButtonPressed?()
    }
    
    // MARK: - Methods
    private func buildHierarchy() {
        addSubview(stackBase)
        stackBase.addArrangedSubview(stackButton)
        stackButton.addArrangedSubview(buttonPrevious)
        stackButton.addArrangedSubview(buttonContinue)
        stackBase.addArrangedSubview(viewStackAux)
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            stackBase.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            stackBase.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackBase.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackBase.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }
}
