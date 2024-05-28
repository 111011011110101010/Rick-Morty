import UIKit

struct FavoritesFactory {
    
    
    func makeFavoritesScene() -> UIViewController {
        
        let favoritesScene = FavoritesScene()
        favoritesScene.title = "Favorites"
        
        return favoritesScene
        
    }
    
    func makeItemTabBar(navigation: Navigation) {
        makeItemTabBar(navigation: navigation,
                       title: "favoritesScene",
                       image: "house",
                       selectedimage: "house.fill")
    }
}

extension FavoritesFactory : ItemTabBarFactory {}
