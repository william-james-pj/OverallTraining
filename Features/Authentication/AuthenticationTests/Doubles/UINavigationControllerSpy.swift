import UIKit

// swiftlint:disable all
final public class UINavigationControllerSpy: UINavigationController {

    private(set) public var currentViewController: UIViewController?
    private(set) public var viewControllerStack: [UIViewController] = []
    override public init(rootViewController: UIViewController) {
        viewControllerStack.append(rootViewController)
        currentViewController = rootViewController
        super.init(nibName: nil, bundle: nil)
    }

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private(set) public var presentedCalled: Int = 0
    private(set) public var viewControllerPresented: UIViewController?
    override public func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentedCalled += 1
        viewControllerPresented = viewControllerToPresent
    }

    private(set) public var dismissCalled: Int = 0
    override public func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        dismissCalled += 1
        viewControllerPresented = nil
    }

    private(set) public var pushCalled: Int = 0
    override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushCalled += 1
        currentViewController = viewController
        viewControllerStack.append(viewController)
    }
    private(set) public var showCalled: Int = 0
    override public func show(_ vc: UIViewController, sender: Any?) {
        showCalled += 1
        currentViewController = vc
        viewControllerStack.append(vc)
    }

    private(set) public var popViewControllerCalled: Int = 0
    override public func popViewController(animated: Bool) -> UIViewController? {
        popViewControllerCalled += 1
        let viewControllerPopped = viewControllerStack.popLast()
        currentViewController = viewControllerStack.last
        return viewControllerPopped
    }

    override public var topViewController: UIViewController? { get {
        viewControllerStack.first
    }}
}
