import Foundation

protocol RootRouterInput: AnyObject {
    
    var transitionHandler: TransitionController? { get set }
}

extension RootRouterInput {
    
    weak var transitionHandler: TransitionController? {
        return nil
    }
}
