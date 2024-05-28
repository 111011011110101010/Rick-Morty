import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: Coordinator?
    var appFactory: AppFactory?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        appFactory = AppFactory()
        appCoordinator = AppCoordinator(navigation: NavigationImplementation(rootViewController: UINavigationController()), window: window, factory: appFactory)
        
        appCoordinator?.start()
    }
}

