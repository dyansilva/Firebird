import UIKit

class RegisterViewController: BaseViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBAction func registerButtonTap(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text {
            if password != confirmPassword {
                showMessage(title: "Aviso!", message: "Senhas não conferem!")
                return
            }
            
            let manager = UserManager(business: UserBuniness())
            manager.register(email: email, password: password) { userModel in
                self.openView(identifier: StoryboardIdentifier.homeViewController)
            } failureHandler: { error in
                self.showMessage(title: "Error", message: error.localizedDescription)
            }

        }
    }
    
    @IBAction func openButtonTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

