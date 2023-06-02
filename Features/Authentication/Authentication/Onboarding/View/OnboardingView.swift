import UIKit

protocol OnboardingViewProtocol where Self: UIView {
    var loginButtonPressed: (() -> Void)? { get set }
    var registerButtonPressed: (() -> Void)? { get set }
}

final class OnboardingView: UIView, OnboardingViewProtocol {
    // MARK: - Variables
    var loginButtonPressed: (() -> Void)?
    var registerButtonPressed: (() -> Void)?
    
    // MARK: - Components
    private let stackBase: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.accessibilityIdentifier = "stackBase"
        return stack
    }()
    
    private let viewContent: UIView = {
        let view = UIView()
        return view
    }()
    
    private let stackContent: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 32
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let viewImageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let stackText: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 24
        stack.distribution = .fill
        return stack
    }()
    
    private let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "A dor é temporária, mas a glória é para sempre"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .textColor
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let labelDescription: UILabel = {
        let label = UILabel()
        label.text = "Treinos prontos e personalizados: a combinação ideal para alcançar seu melhor desempenho."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .textColor
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let viewFooter: UIView = {
        let view = UIView()
        view.backgroundColor = .primaryColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "viewFooter"
        return view
    }()
    
    private let stackFooter: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.accessibilityIdentifier = "stackFooter"
        return stack
    }()
    
    private let buttonRegister: UIButton = {
        var config = UIButton.Configuration.plain()
        config.titleAlignment = .center
        config.baseForegroundColor = .white
        config.buttonSize = .small

        var container = AttributeContainer()
        container.font = .systemFont(ofSize: 14, weight: .semibold)
        config.attributedTitle = AttributedString("Continuar", attributes: container)

        let button = UIButton()
        button.configuration = config
        button.accessibilityIdentifier = "buttonRegister"
        return button
    }()
    
    private let buttonLogin: UIButton = {
        var config = UIButton.Configuration.filled()
        config.titleAlignment = .center
        config.baseBackgroundColor = .cardColor
        config.baseForegroundColor = .textColor
        config.buttonSize = .large
        
        var container = AttributeContainer()
        container.font = .systemFont(ofSize: 16, weight: .bold)
        config.attributedTitle = AttributedString("Comece agora", attributes: container)
        
        let button = UIButton()
        button.configuration = config
        button.accessibilityIdentifier = "buttonLogin"
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
        backgroundColor = .backgroundColor
        
        setupActions()
        buildHierarchy()
        buildConstraints()
    }
    
    private func setupActions() {
        buttonLogin.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        buttonRegister.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func loginButtonAction() {
        loginButtonPressed?()
    }
    
    @objc private func registerButtonAction() {
        registerButtonPressed?()
    }

    // MARK: - Methods
    private func buildHierarchy() {
        addSubview(stackBase)
        stackBase.addArrangedSubview(viewContent)
        
        viewContent.addSubview(stackContent)
        stackContent.addArrangedSubview(viewImageContainer)
        viewImageContainer.addSubview(imageLogo)
        
        stackContent.addArrangedSubview(stackText)
        stackText.addArrangedSubview(labelTitle)
        stackText.addArrangedSubview(labelDescription)
        
        stackBase.addArrangedSubview(viewFooter)
        viewFooter.addSubview(stackFooter)
        stackFooter.addArrangedSubview(buttonRegister)
        stackFooter.addArrangedSubview(buttonLogin)
    }

    private func buildConstraints() {
        NSLayoutConstraint.activate([
            stackBase.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackContent.topAnchor.constraint(equalTo: viewContent.topAnchor),
            stackContent.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 24),
            stackContent.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor, constant: -24),
            stackContent.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor),
            
            viewImageContainer.heightAnchor.constraint(equalToConstant: 280),
            
            imageLogo.widthAnchor.constraint(equalToConstant: 250),
            imageLogo.heightAnchor.constraint(equalToConstant: 250),
            imageLogo.centerXAnchor.constraint(equalTo: viewImageContainer.centerXAnchor),
            imageLogo.centerYAnchor.constraint(equalTo: imageLogo.centerYAnchor),
            
            viewFooter.heightAnchor.constraint(equalToConstant: 130),
            
            stackFooter.topAnchor.constraint(equalTo: viewFooter.topAnchor, constant: 32),
            stackFooter.leadingAnchor.constraint(equalTo: viewFooter.leadingAnchor, constant: 24),
            stackFooter.trailingAnchor.constraint(equalTo: viewFooter.trailingAnchor, constant: -24),
            stackFooter.bottomAnchor.constraint(equalTo: viewFooter.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
