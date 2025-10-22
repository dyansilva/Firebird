import UIKit

class RegisterCoodinator: Coordinator {
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RegisterViewController()
    
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
