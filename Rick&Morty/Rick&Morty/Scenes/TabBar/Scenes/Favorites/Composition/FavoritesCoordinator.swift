import UIKit


final class FavoritesCoordinator: Coordinator {
    
    var navigation: Navigation
    var factory: FavoritesFactory
    var childCoordinators: [Coordinator] = []
    
    init(navigation: Navigation, factory: FavoritesFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        
        let favoritesScene = factory.makeFavoritesScene()
        navigation.pushViewController(favoritesScene, animated: true)
        navigation.navigationBar.prefersLargeTitles = true
        factory.makeItemTabBar(navigation: navigation)
        
    }
}
