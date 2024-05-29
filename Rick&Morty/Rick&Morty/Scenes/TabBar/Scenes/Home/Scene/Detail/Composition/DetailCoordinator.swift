import UIKit


final class DetailCoordinator: Coordinator {
    
    var navigation: Navigation
    var factory: DetailFactory
    var childCoordinators: [Coordinator] = []
    var title: String
    
    init(navigation: Navigation, factory: DetailFactory, title: String) {
        self.navigation = navigation
        self.factory = factory
        self.title = title
    }
    
    func start() {
        
        let detailScene = factory.makeDetailScene(titleText: title)
        navigation.pushViewController(detailScene, animated: true)
        navigation.navigationBar.prefersLargeTitles = true        
    }
}

extension FavoritesCoordinator: ParentCoordinator {}
