import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Clouser
    var onRegisterSuccess: (() -> Void)?
    
    lazy var registerView: RegisterView = {
        let view = RegisterView(frame: .zero)
        
        view.onRegisterTap = { [weak self] email, password in
            self?.registerTap(email, password)
        }
        
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Cadastro"
    }
    
    // MARK: - Actions
    private func registerTap(_ email: String, _ password: String) {
        let userViewModel = UserViewModel()
        userViewModel.setUserFromAPI(email, password) { [weak self] result in
            switch result {
            case .success(_):
                self?.onRegisterSuccess?()
            case .failure(let error):
                self?.showMessage("Error", error.localizedDescription)
            }
        }
    }
    
    func showMessage(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
