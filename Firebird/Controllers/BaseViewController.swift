import UIKit

enum StoryboardIdentifier: String {
    case homeViewController = "homeViewController"
    case registerViewController = "registerViewController"
    case loginViewController = "loginViewController"
}

class BaseViewController: UIViewController {
    
    func openView(identifier: StoryboardIdentifier) {
        guard let viewController = storyboard?.instantiateViewController(identifier: identifier.rawValue) else {
            showMessage(title: "Aviso!", message: "Não foi possível abrir a tela.")
            return
        }
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

