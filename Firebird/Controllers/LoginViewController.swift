import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func openButtonTaped(_ sender: Any) {
        let manager = UserManager(business: UserBuniness())
        
        if let email = mailTextField.text, let password = passwordTextField.text {
            manager.login(email: email, password: password) { userModel in
                self.openHomeView()
            } failureHandler: { error in
                self.showMessage(title: "Error", message: error.localizedDescription)
            }
            
        }
    }
    
    @IBAction func registerButtonTap(_ sender: Any) {
     
    }
    
    func showMessage(title: String, message: String) {
        let alert =  UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func openHomeView() {
        let home = self.storyboard?.instantiateViewController(identifier: "homeViewController")
        home?.modalPresentationStyle = .fullScreen
        if let home = home {
            self.present(home, animated: true)
        } else {
            self.showMessage(title: "Aviso!", message: "Não foi possivel realizar o login.")
        }
    }
}
