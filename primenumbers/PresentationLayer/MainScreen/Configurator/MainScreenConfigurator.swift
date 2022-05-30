import UIKit

class MainScreenConfigurator {
    
    func configureModuleForViewInput(viewInput: UIViewController) {
        
        guard let viewController = viewInput as? MainScreenViewController else { return }
        configure(viewController: viewController)
    }

    private func configure(viewController: MainScreenViewController) {
        
        let presenter = MainSreenPresenter()
        presenter.view = viewController
        viewController.output = presenter
        presenter.router = MainScreenRouter()
        presenter.router.transitionHandler = viewController
    }
}

