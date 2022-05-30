import UIKit

class MainScreenRouter: MainScreenRouterInput {
    
    var transitionHandler: TransitionController?
    
    func showAlert(title: String, message: String) {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertVC.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        transitionHandler?.presentModule(alertVC)
    }
}
