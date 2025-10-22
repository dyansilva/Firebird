import UIKit

class LoginViewController: UIViewController {
    // MARK: - Clousers
    var onRegisterTap: (() -> Void)?
    
    // MARK: Properts
    lazy var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        
        view.onRegisterTap = {
            self.onRegisterTap?()
        }
        
        return view
    }()
    
    // MARK: Overrides
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
    }
}
