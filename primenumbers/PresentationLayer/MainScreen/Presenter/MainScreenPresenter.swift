import Foundation

class MainSreenPresenter: MainScreenViewOutput {
    
    weak var view: MainScreenViewInput!
    
    var router: MainScreenRouter!
    
    func viewDidLoad() {
        
        view.setupInitialState()
    }
    
    func calculate(goal: String?) {
        
        guard let intGoal = Int(goal ?? ""), !(goal?.isEmpty ?? true), intGoal > 0 else {
            
            router.showAlert(title: "Error", message: "Incorrect input data")
            return
        }
        
        var printNumbers = Set<Int>()
        var resultString = "\(intGoal): "
        
        if !(0...2 ~= intGoal) {
            for i in 3...intGoal {
                
                if !(2...i-1).contains(where: { i % $0 == 0 }) {
                    printNumbers.insert(i)
                }
            }
        } else {
            printNumbers.insert(1)
        }
        
        printNumbers.sorted().forEach({ resultString += "\($0) "})
        
        view?.updateResult(value: resultString)
    }
}
