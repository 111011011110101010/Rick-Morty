import UIKit

struct TabBarFactory {
        
    func makeTabBarScene() -> UITabBarController {
        let tabBarScene = TabBarScene()
        return tabBarScene
    }
    
    func makeChildCoordinator() -> [Coordinator] {
        let homeCoordinator = makeHomeCoordinator()
        let favoritesCoordinator = makeFavoritesCoordinator()

        
        return [homeCoordinator, favoritesCoordinator]
    }
    
   private func makeHomeCoordinator() -> Coordinator {
        let factory = HomeFactory()
        let navigation = NavigationImplementation(rootViewController: UINavigationController())
        return HomeCoordinator(navigation: navigation, factory: factory)
    }
    
   private func makeFavoritesCoordinator() -> Coordinator {
        let factory = FavoritesFactory()
       let navigation = NavigationImplementation(rootViewController: UINavigationController())
        return FavoritesCoordinator(navigation: navigation, factory: factory)
    }
}
