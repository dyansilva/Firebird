import UIKit

class RegisterCoodinator: Coordinator {
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RegisterViewController()
        
        viewController.onRegisterSuccess = {
            let coodinator = HomeCoordinator(navigationController: self.navigationController)
            coodinator.start()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
