import UIKit

final class RegisterPicker: UIView {
    private var pickerDelegate: RegisterPickerViewDelegateProtocol
    private var pickerDataSource: RegisterPickerViewDataSourceProtocol
    
    // MARK: - Components
    private let pickerView: UIPickerView = {
        let view = UIPickerView()
        view.backgroundColor = .cardColor
        view.clipsToBounds = true
        view.layer.cornerRadius = 48
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    init(pickerDelegate: RegisterPickerViewDelegateProtocol = RegisterPickerViewDelegate(),
         pickerDataSource: RegisterPickerViewDataSourceProtocol = RegisterPickerViewDataSource()) {
        self.pickerDelegate = pickerDelegate
        self.pickerDataSource = pickerDataSource
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupView() {
        setupPicker()
        buildHierarchy()
        buildConstraints()
    }
    
    private func setupPicker() {
        pickerDataSource.data = ["1", "2", "3", "4", "5"]
        pickerDelegate.didSelectCell = selectCell
        
        pickerView.dataSource = pickerDataSource
        pickerView.delegate = pickerDelegate
    }
    
    // MARK: - Methods
    private func selectCell(index: Int) {
        print(index)
    }
    
    private func buildHierarchy() {
        addSubview(pickerView)
    }
    
    private func buildConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: 320),
            
            pickerView.widthAnchor.constraint(equalToConstant: 140),
            pickerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pickerView.topAnchor.constraint(equalTo: topAnchor),
            pickerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
