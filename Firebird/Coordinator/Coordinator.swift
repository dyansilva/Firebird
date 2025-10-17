import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    init (navigationController: UINavigationController)
    func start()
}
