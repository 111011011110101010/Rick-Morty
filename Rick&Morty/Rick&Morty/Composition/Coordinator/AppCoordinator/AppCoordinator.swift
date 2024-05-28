import UIKit

class AppCoordinator: Coordinator {
    
    var navigation: Navigation
    var window: UIWindow?
    var factory: AppFactory?
    var childCoordinators: [Coordinator] = [] 
    
    init(navigation: Navigation, window: UIWindow?, factory: AppFactory?) {
        self.navigation = navigation
        self.window = window
        self.factory = factory
    }
    
    func start() {
        configureWindow()
        launchCoordinator()
    }
    
    func configureWindow() {
        window?.rootViewController = navigation.rootViewController
        window?.makeKeyAndVisible()
    }
    
    func launchCoordinator() {
        let tabBarCoordinator = factory?.makeTabBarCoordinator(navigation: navigation)
        addChildCoordinator(tabBarCoordinator)
    }
    
    func removeAllCoordinatorAndStartIt() {
        navigation.viewControllers = []
        clearAllChildCoordinators()
        launchCoordinator()
    }
}

extension AppCoordinator: ParentCoordinator {}
