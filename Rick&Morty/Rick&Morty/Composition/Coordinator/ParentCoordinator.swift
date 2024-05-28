import UIKit

protocol ParentCoordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }

}

extension ParentCoordinator {
    
    func addChildCoordinator(_ childCoordinator: Coordinator?) {
        guard let childCoordinator else { return }
        childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }
    
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
    
    func clearAllChildCoordinators() {
        childCoordinators = []
    }
}
