import UIKit

struct AppFactory {
    
    func makeTabBarCoordinator(navigation: Navigation) -> Coordinator {
        let factory = TabBarFactory()
        return TabBarCoordinator(navigation: navigation, factory: factory)
    }
    
}
