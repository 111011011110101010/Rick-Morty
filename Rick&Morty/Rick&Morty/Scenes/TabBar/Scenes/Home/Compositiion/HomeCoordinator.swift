import UIKit


final class HomeCoordinator: Coordinator {
    
    var navigation: Navigation
    var factory: HomeFactory
    var childCoordinators: [Coordinator] = []
    
    init(navigation: Navigation, factory: HomeFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        
        let homeScene = factory.makeHomeScene()
        navigation.pushViewController(homeScene, animated: true)
        navigation.navigationBar.prefersLargeTitles = true
        factory.makeItemTabBar(navigation: navigation)
        
    }
}

extension FavoritesCoordinator: ParentCoordinator {}
