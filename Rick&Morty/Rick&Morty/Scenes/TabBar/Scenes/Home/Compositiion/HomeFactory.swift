import UIKit

struct HomeFactory {
    
    
    func makeHomeScene() -> UIViewController {
        
        let homeScene = HomeScene()
        homeScene.title = "Home"
        
        return homeScene
        
    }
    
    func makeItemTabBar(navigation: Navigation) {
        makeItemTabBar(navigation: navigation,
                       title: "Home",
                       image: "house",
                       selectedimage: "house.fill")
    }
}

extension HomeFactory : ItemTabBarFactory {}
