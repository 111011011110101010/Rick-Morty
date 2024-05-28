import UIKit

protocol Coordinator: AnyObject {
    
    var navigation: Navigation { get set }
    func start()
    
}
