import UIKit

class BaseViewController: UIViewController {
    
    private var loadFace: UIView?
    
    func showLoadingFace() {
        
        guard loadFace == nil else { return }
        
        let backgroundView = UIView(frame: .zero)
        backgroundView.backgroundColor = view.backgroundColor
        backgroundView.alpha = 0.3
        
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        if let superview = backgroundView.superview {
            backgroundView.leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            backgroundView.rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            backgroundView.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            backgroundView.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
        
        let activityIndicator: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            activityIndicator = UIActivityIndicatorView(style: .large)
        } else {
            activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        }
        
        backgroundView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        if let anchorX = activityIndicator.superview?.centerXAnchor,
           let anchorY = activityIndicator.superview?.centerYAnchor {
            activityIndicator.centerXAnchor.constraint(equalTo: anchorX).isActive = true
            activityIndicator.centerYAnchor.constraint(equalTo: anchorY).isActive = true
        }
        
        activityIndicator.startAnimating()
        
        loadFace = backgroundView
    }
    
    func hideLoadingFace() {
        loadFace?.alpha = 0.0
        loadFace?.removeFromSuperview()
        loadFace = nil
    }
}

extension BaseViewController: TransitionController {
    
    func addModuleAsChildAndFill(_ viewController: UIViewController) {
    }
    
    func presentModule(_ viewController: UIViewController) {
        present(viewController, animated: true)
    }
    
    func presentModuleOnTop(with viewController: UIViewController) {
    }
    
    func pushModule(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    /// Dismiss current module
    /// If module is contained in `UINavigationController` and
    /// is not root controller, then function `popViewController` is called from `UINavigationController`.
    ///
    /// - Parameter animated: true to dismiss module animated
    /// - Parameter popToRoot: true to pop controllers to root
    /// - Parameter completion: Completion if available, *IMPORTANT* won't be called otherwise
    func dismissModule(animated: Bool, popToRoot: Bool, completion: @escaping () -> Void) {
        switch parent {
        case let navigationController as UINavigationController where !navigationController.viewControllers.isEmpty &&
                navigationController.viewControllers.first != self:
            if popToRoot {
                navigationController.popToRootViewController(animated: animated)
            } else {
                navigationController.popViewController(animated: animated)
            }
        case _ where parent?.presentingViewController != nil || parent?.popoverPresentationController != nil:
            dismiss(animated: animated, completion: completion)
        case let navigationController as UINavigationController where !navigationController.viewControllers.isEmpty:
            if popToRoot {
                navigationController.popToRootViewController(animated: animated)
            } else {
                navigationController.popViewController(animated: animated)
            }
        default:
            dismiss(animated: animated, completion: completion)
        }
    }
    
    /// Dismiss current module
    /// If module is contained in `UINavigationController` and
    /// is not root controller, then function `popViewController` is called from `UINavigationController`.
    ///
    /// - Parameter animated: true to dismiss module animated
    /// - Parameter popToRoot: true to pop controllers to root
    @objc
    func dismissModule(animated: Bool, popToRoot: Bool) {
        dismissModule(animated: animated, popToRoot: popToRoot, completion: { })
    }
}
