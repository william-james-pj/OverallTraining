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
        stack.spacing = 32
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let viewContent: UIView = {
        let view = UIView()
        return view
    }()
    
    private let stackContent: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 40
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let stackContentText: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Qual é a sua idade?"
        label.textAlignment = .center
        label.textColor = .textColor
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let labelSubTitle: UILabel = {
        let label = UILabel()
        label.text = "Isso é usado para obter resultados e planos personalizados para você"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .disabledColor
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let pickerView: RegisterPicker = {
        let view = RegisterPicker()
        return view
    }()
    
    private let viewContentAux = UIView()
    
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
        viewContent.addSubview(stackContent)
        stackContent.addArrangedSubview(stackContentText)
        stackContentText.addArrangedSubview(labelTitle)
        stackContentText.addArrangedSubview(labelSubTitle)
        stackContent.addArrangedSubview(pickerView)
        
        stackBase.addArrangedSubview(viewRegisterFooter)
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([            
            stackBase.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            stackBase.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackBase.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackBase.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackContent.topAnchor.constraint(equalTo: viewContent.topAnchor),
            stackContent.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 24),
            stackContent.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor, constant: -24),
            stackContent.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor),
        ])
    }
}
