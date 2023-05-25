import UIKit

extension UIView {
    public func findByAccessibilityIdentifier(identifier: String) -> UIView? {
        let views = self.subviews.filter {$0.accessibilityIdentifier == identifier}
        return views.first
    }
}
