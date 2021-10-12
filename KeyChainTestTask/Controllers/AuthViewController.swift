//
//  ViewController.swift
//  KeyChainTestTask
//
//  Created by Сергей Горбачёв on 12.10.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter login"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        button.setTitle("SignIN", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self,
                         action: #selector(signInButtonTapped),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var stackView = UIStackView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if KeyChainManager.shared.loginUser() {
            let mainViewController = MainViewController()
            mainViewController.modalPresentationStyle = .fullScreen
            present(mainViewController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        title = "Authorization"
        view.backgroundColor = .white
        
        stackView = UIStackView(arrangedSubviews: [loginTextField,
                                                   passwordTextField],
                                axis: .vertical,
                                spacing: 10,
                                distribution: .equalCentering)
        
        view.addSubview(stackView)
        view.addSubview(signInButton)
    }
    
    @objc private func signInButtonTapped() {
        
        guard let loginText = loginTextField.text else { return }
        guard let passwordText = passwordTextField.text else { return }
        
        if loginText.isEmpty == false && passwordText.isEmpty == false {
            KeyChainManager.shared.saveUser(login: loginText, password: passwordText)
            
            let mainViewController = MainViewController()
            mainViewController.modalPresentationStyle = .fullScreen
            present(mainViewController, animated: false, completion: nil)
            
            loginTextField.text = ""
            passwordTextField.text = ""
        } else {
            alertError()
        }   
    }
}

extension AuthViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            signInButton.widthAnchor.constraint(equalToConstant: 250),
            signInButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

