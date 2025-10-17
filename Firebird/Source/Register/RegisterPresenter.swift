import Foundation

protocol RegisterPresenterProtocol {
    func showMessage(title: String, message: String)
    func goToHome()
}

class RegisterPresenter {
    var delegate: RegisterPresenterProtocol?
    
    func register(userModel: UserModel) {
        let manager = UserManager(business: UserBuniness())
        
        manager.register(email: userModel.email, password: userModel.password) {[weak self] userModel in
            self?.delegate?.goToHome()
        } failureHandler: {[weak self] error in
            self?.delegate?.showMessage(title: "Error", message: error.localizedDescription)
        }
    }
    
    
}
