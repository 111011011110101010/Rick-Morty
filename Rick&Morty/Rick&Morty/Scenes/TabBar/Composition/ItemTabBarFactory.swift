import UIKit

protocol ItemTabBarFactory {}
extension ItemTabBarFactory {
    
    func makeItemTabBar(navigation: Navigation, title: String, image: String, selectedimage: String) {
        
        let itemTabBar = UITabBarItem(title: title, image: UIImage(named: image), selectedImage: UIImage(named: selectedimage))
        navigation.rootViewController.tabBarItem = itemTabBar
    }
}
