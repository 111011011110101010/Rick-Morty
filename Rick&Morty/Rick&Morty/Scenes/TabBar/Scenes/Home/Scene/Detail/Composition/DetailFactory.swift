import UIKit

struct DetailFactory {
    
    func makeDetailScene(titleText: String) -> UIViewController {
        
        let detailScene = DetailScene(titleText: titleText)
        
        return detailScene
        
    }
    
}
