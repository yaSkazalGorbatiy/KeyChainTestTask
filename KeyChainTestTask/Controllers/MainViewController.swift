//
//  MainViewController.swift
//  KeyChainTestTask
//
//  Created by Сергей Горбачёв on 12.10.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private let signOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        button.setTitle("SignOUT", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self,
                         action: #selector(signOutButtonTapped),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        title = "Main VC"
        view.backgroundColor = .white
        
        view.addSubview(signOutButton)
    }
    
    @objc private func signOutButtonTapped() {
        
        KeyChainManager.shared.deleteUser()
        
        dismiss(animated: true, completion: nil)
    }
}

extension MainViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signOutButton.widthAnchor.constraint(equalToConstant: 250),
            signOutButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

