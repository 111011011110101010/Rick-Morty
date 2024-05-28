import UIKit

class TabBarCoordinator: Coordinator {
    
    var navigation: Navigation
    private let factory: TabBarFactory
    private var childCoordinators: [Coordinator] = []
 
    
    init(navigation: Navigation, factory: TabBarFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let tabBarScene = factory.makeTabBarScene()
        navigation.navigationBar.isHidden = true
        navigation.pushViewController(tabBarScene, animated: true)
        
        childCoordinators = factory.makeChildCoordinator()
        let childNavigation = childCoordinators.map { $0.navigation.rootViewController }
        tabBarScene.viewControllers = childNavigation
        childCoordinators.forEach { $0.start() }
    }
}
