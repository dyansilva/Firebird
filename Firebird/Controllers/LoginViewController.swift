import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func openButtonTaped(_ sender: Any) {
        let manager = UserManager(business: UserBuniness())
        
        if let email = mailTextField.text, let password = passwordTextField.text {
            manager.login(email: email, password: password) { userModel in
                self.openView(identifier: .homeViewController)
            } failureHandler: { error in
                self.showMessage(title: "Error", message: error.localizedDescription)
            }
            
        }
    }
    
    @IBAction func registerButtonTap(_ sender: Any) {
        self.openView(identifier: .registerViewController)
    }
}

