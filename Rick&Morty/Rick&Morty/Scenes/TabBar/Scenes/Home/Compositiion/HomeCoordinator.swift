import UIKit


final class HomeCoordinator: Coordinator {
    
    var navigation: Navigation
    var factory: HomeFactory
    var childCoordinators: [Coordinator] = []
    var detailCoordinator: DetailCoordinator?
    

    
    init(navigation: Navigation, factory: HomeFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        
        let homeScene = factory.makeHomeScene(delegate: self)
        navigation.pushViewController(homeScene, animated: true)
        navigation.navigationBar.prefersLargeTitles = true
        factory.makeItemTabBar(navigation: navigation)
        
    }
}

extension HomeCoordinator: HomeSceneDelegate {
    
    func didTap(title: String) {
        
        let factory = DetailFactory()
        detailCoordinator = DetailCoordinator(navigation: navigation, factory: factory, title: title)
        addChildCoordinator(detailCoordinator)
        
    }
    
}

extension HomeCoordinator: ParentCoordinator {}
