import UIKit

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        
        viewController.onRegisterTap = {
            let coodinator = RegisterCoodinator(navigationController: self.navigationController)
            coodinator.start()
        }
        
        viewController.onLoginSuccess = {
            let coodinator = HomeCoordinator(navigationController: self.navigationController)
            coodinator.start()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
