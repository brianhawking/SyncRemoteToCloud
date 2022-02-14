//
//  RegisterViewController.swift
//  SyncLocalToCloud
//
//  Created by Brian Veitch on 2/12/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    let appTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Registration"
        return label
    }()
    
    let emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont.systemFont(ofSize: 20)
        textfield.placeholder = "Enter email..."
        textfield.backgroundColor = .white
        textfield.setPadding(20, 20)
        textfield.layer.cornerRadius = 10
        textfield.setDimensions(width: 10, height: 50)
        return textfield
    }()
    
    let passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont.systemFont(ofSize: 20)
        textfield.placeholder = "Enter password"
        textfield.isSecureTextEntry = true
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 10
        textfield.setPadding(20, 20)
        textfield.setDimensions(width: 10, height: 50)
        return textfield
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.setDimensions(width: 500, height: 50)
        button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Already have an account? Log in here!", for: .normal)
        button.addTarget(self, action: #selector(goToLogin), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureUI()
        
        print(FileManager.default.urls(for: .documentDirectory, in:
            .userDomainMask)[0])
    }
    
    func configureUI() {
        
        view.backgroundColor = .systemCyan
        
        let stackview = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, registerButton])
        stackview.axis = .vertical
        stackview.spacing = 20
        
        view.addSubview(stackview)
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        
        view.addSubview(loginButton)
        loginButton.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 20, paddingBottom: 40, paddingRight: 20)
        
    }
    
    // MARK: - SELECTORS
    
    @objc func handleRegistration() {
        
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
//        AuthManager.shared.logInUser(withEmail: email, withPassword: password) { result, error in
//            if error != nil {
//                print("DEBUG: \(Constants.error.loginError.rawValue)")
//                return
//            }
//
//            self.navigationController?.pushViewController(HomeViewController(), animated: true)
//        }
        
    }
    
    @objc func goToLogin() {
        dismiss(animated: true, completion: nil)
    }
    

}
