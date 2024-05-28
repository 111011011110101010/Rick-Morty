import UIKit

protocol Navigation {
    
    var rootViewController: UINavigationController { get }
    var viewControllers: [UIViewController] { get set }
    var navigationBar: UINavigationBar { get }
    func present(_ viewControllerToPresent: UIViewController, animated: Bool)
    func pushViewController(_ viewControllerToPush: UIViewController, animated: Bool, backCompletion: (() -> Void)?)
    func dismiss(animated: Bool)
    var dismissNavigation: (() -> Void)? { get set }
    
}

extension Navigation {
    
    func pushViewController(_ viewControllerToPush: UIViewController, animated: Bool) {
        pushViewController(viewControllerToPush, animated: animated, backCompletion: nil)
    }
}
