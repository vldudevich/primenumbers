import Foundation

protocol MainScreenViewInput: AnyObject {
    
    func setupInitialState()
    func updateResult(value: String)
}
