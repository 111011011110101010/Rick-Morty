import UIKit

struct HomeFactory {
    
    
    func makeHomeScene(delegate: HomeSceneDelegate) -> UIViewController {
        
        let homeScene = HomeScene(delegate: delegate)
        
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
