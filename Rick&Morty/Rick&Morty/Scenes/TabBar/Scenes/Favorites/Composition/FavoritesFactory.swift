import UIKit

struct FavoritesFactory {
    
    
    func makeFavoritesScene() -> UIViewController {
        
        let favoritesScene = FavoritesScene()
        favoritesScene.title = "Favorites"
        
        return favoritesScene
        
    }
    
    func makeItemTabBar(navigation: Navigation) {
        makeItemTabBar(navigation: navigation,
                       title: "Favorites",
                       image: "heart",
                       selectedimage: "heart.fill")
    }
}

extension FavoritesFactory : ItemTabBarFactory {}
