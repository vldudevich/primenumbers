import UIKit

class MainScreenViewController: BaseViewController {
    
    // MARK: - Static members
    // MARK: - Enums
    // MARK: - Overrides
    
    // MARK: - Outlets
    
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!
    
    var output: MainScreenViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoad()
    }

    // MARK: - Lifecycle
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: MainScreenViewInput
extension MainScreenViewController: MainScreenViewInput {
    
    func setupInitialState() {
        
        setupUI()
    }
    
    func updateResult(value: String) {
        
        resultLabel.text = value
    }
    
}

// MARK: Private extension
private extension MainScreenViewController {
    
    func setupUI() {

        inputTextField.placeholder = "Input number"
        
        resultLabel.text = ""
        
        startButton.setTitle("Calculate", for: .normal)
        startButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc
    func didTapButton() {
        
        output.calculate(goal: inputTextField.text)
    }
}
