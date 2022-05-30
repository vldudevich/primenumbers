

import Foundation

class MainScreenInitializer: NSObject {

    @IBOutlet private weak var viewController: MainScreenViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let configurator = MainScreenConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
}
