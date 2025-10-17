import UIKit

class RegisterViewController: UIViewController {
    let present: RegisterPresenter = RegisterPresenter()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmationPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        present.delegate = self
    }
    
    @IBAction func registerButtonTap(_ sender: Any) {
       if let email = emailTextField.text,
          let password = passwordTextField.text,
          let confirmationPassword = confirmationPasswordTextField.text {
           if  password != confirmationPassword {
               showMessage(title: "Error", message: "Passwords do not match")
               return
           }
            let userModel = UserModel(email: email, password: password)
            self.present.register(userModel: userModel)
        }
    }
    @IBAction func openButtonTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension RegisterViewController: RegisterPresenterProtocol {
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func goToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let home = storyboard.instantiateViewController(identifier: "homeViewController")
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: true)
    }
    
    
}
