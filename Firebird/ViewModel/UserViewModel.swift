import Foundation

class UserViewModel {
    private let model : UserModel
    
    init(model: UserModel) {
        self.model = model
    }
    
    init() {
        self.model = UserModel()
    }
    
    var email: String {
        return model.email
    }
    
    func getUserFromAPI(_ email: String, _ password: String, completion: @escaping(Result<UserViewModel, Error>) -> Void) {
        let manager = UserManager(business: UserBuniness())
        manager.login(email: email, password: password) { userModel in
            completion(.success(UserViewModel(model: userModel)))
        } failureHandler: { error in
            completion(.failure(error))
        }
    }
    
    func setUserFromAPI(_ email: String, _ password: String, completion: @escaping(Result<UserViewModel, Error>) -> Void) {
        let manager = UserManager(business: UserBuniness())
        manager.register(email: email, password: password) { userModel in
            completion(.success(UserViewModel(model: userModel)))
        } failureHandler: { error in
            completion(.failure(error))
        }
    }
}
