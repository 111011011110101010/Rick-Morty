import UIKit

final class NavigationImplementation: NSObject, Navigation {
    
    var rootViewController: UINavigationController
    
    var viewControllers: [UIViewController] {
        get {
            rootViewController.viewControllers
        }
        set {
            rootViewController.viewControllers = newValue
        }
    }
    
    var navigationBar: UINavigationBar {
        rootViewController.navigationBar
    }
    
    var backCompletions: [UIViewController : () -> Void] = [:]
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
        super.init()
        rootViewController.delegate = self
        rootViewController.presentationController?.delegate = self
    }
    
    func present(_ viewControllerToPresent: UIViewController, animated: Bool) {
        rootViewController.present(viewControllerToPresent, animated: animated)
    }
    
    func dismiss(animated: Bool) {
        rootViewController.dismiss(animated: animated)
    }
    
    var dismissNavigation: (() -> Void)?
    
    func pushViewController(_ viewControllerToPush: UIViewController, animated: Bool, backCompletion: (() -> Void)?) {
        
        if let backCompletion {
            backCompletions[viewControllerToPush] = backCompletion
        }
        
        rootViewController.pushViewController(viewControllerToPush, animated: animated)
        
    }
}

extension NavigationImplementation: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let conroller = navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(conroller) else { return }
        guard let completion = backCompletions[conroller] else { return }
        completion()
        backCompletions.removeValue(forKey: conroller)
    }
}

extension NavigationImplementation: UIAdaptivePresentationControllerDelegate {
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        dismissNavigation?()
        dismissNavigation = nil
    }
}
