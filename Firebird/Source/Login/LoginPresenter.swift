import Foundation

protocol LoginPresenterProtocol {
    func showMessage(title: String, message: String)
    func goHome()
}

class LoginPresenter {
    var delegate: LoginPresenterProtocol?
    
    func login(userModel: UserModel) {
        let manager = UserManager(business: UserBuniness())
        manager.login(email: userModel.email, password: userModel.password) {[weak self] userModel in
            self?.goHome()
        } failureHandler: {[weak self] error in
            self?.delegate?.showMessage(title: "error", message: error.localizedDescription)
        }

    }
    
    func goHome() {
        self.delegate?.goHome()
    }
}
