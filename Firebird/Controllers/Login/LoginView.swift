import UIKit

class LoginView: UIView {
    // MARK - Clousers
    var onRegisterTap: (() -> Void)?
    
    // MARK: - Properts
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "E-mail"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        
        textField.backgroundColor = .white
        textField.textColor = .black
        
        textField.setLeftPaddingPoints(8)
        textField.placeholder = "Endereço de email"
        textField.keyboardType = .emailAddress
        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        
        textField.backgroundColor = .white
        textField.textColor = .black
        
        textField.setLeftPaddingPoints(8)
        textField.placeholder = "digite a sua senha"
        
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var LoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var RegisterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar-se", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray4
        
        setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set visual elements
    
    func setVisualElements() {
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(LoginButton)
        self.addSubview(RegisterButton)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            LoginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            LoginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            LoginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            LoginButton.heightAnchor.constraint(equalToConstant: 40),
            
            RegisterButton.topAnchor.constraint(equalTo: LoginButton.bottomAnchor, constant: 24),
            RegisterButton.leadingAnchor.constraint(equalTo: LoginButton.leadingAnchor),
            RegisterButton.trailingAnchor.constraint(equalTo: LoginButton.trailingAnchor),
            RegisterButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    // MARK: - Actions
    @objc
    func registerButtonTap() {
        self.onRegisterTap?()
    }
}
