import UIKit

protocol RegisterProgressProtocol where Self: UIView {
    func setSteps(steps: Int, currentStep current: Int)
}

final class RegisterProgress: UIView, RegisterProgressProtocol {
    // MARK: - Variables
    private var numberOfSteps = 0
    private var currentStep = 0
    private var elementViews: [RegisterProgressStepProtocol] = []
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupView() {
        createSteps()
        createStack()
    }
    
    // MARK: - Methods
    func setSteps(steps: Int, currentStep current: Int) {
        numberOfSteps = steps
        currentStep = current
        setupView()
    }
    
    private func createSteps() {
        elementViews = [RegisterProgressStepProtocol]()
        elementViews.removeAll()
        subviews.forEach({$0.removeFromSuperview()})
        
        for index in 1...numberOfSteps {
            let view = RegisterProgressStep()
            
            if (index <= currentStep) {
                view.setCurrentStep()
            }
            
            elementViews.append(view)
        }
    }
    
    private func createStack() {
        let stackBase = UIStackView(arrangedSubviews: elementViews)
        stackBase.axis = .horizontal
        stackBase.spacing = 8
        stackBase.distribution = .fillEqually
        stackBase.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackBase)

        NSLayoutConstraint.activate([
            heightAnchor.constraint(lessThanOrEqualToConstant: 5),
            
            stackBase.topAnchor.constraint(equalTo: topAnchor),
            stackBase.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackBase.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackBase.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
