import UIKit

protocol RegisterPickerViewDelegateProtocol: UIPickerViewDelegate {
    var didSelectCell: ((Int) -> Void)? { get set }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
}

final class RegisterPickerViewDelegate: NSObject, UIPickerViewDelegate, RegisterPickerViewDelegateProtocol {
    var didSelectCell: ((Int) -> Void)?
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        didSelectCell?(row)
    }
}
