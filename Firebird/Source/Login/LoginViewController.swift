import UIKit


class LoginViewController: UIViewController {
    let presenter: LoginPresenter = LoginPresenter()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func openButtonTap(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            let userModel: UserModel = UserModel(email: email, password: password)
            presenter.login(userModel: userModel)
        }
    }
    

    @IBAction func registerButtonTap(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.delegate = self
    }
}


extension LoginViewController: LoginPresenterProtocol {
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func goHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let home = storyboard.instantiateViewController(identifier: "homeViewController") as! HomeViewController
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: true)
    }
}
