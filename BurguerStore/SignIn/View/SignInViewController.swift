//
//  SignInViewController.swift
//  BurguerStore
//
//  Created by Fabricio Henrique on 31/07/24.
//

import Foundation
import UIKit

class SignInViewController: UIViewController {
    
    let email: UITextField = {
        let ed = UITextField()
        ed.backgroundColor = .white
        ed.placeholder = "Entre com seu E-mail"
        ed.translatesAutoresizingMaskIntoConstraints = false
        ed.layer.cornerRadius = 10
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: ed.frame.height))
        ed.leftView = paddingView
        ed.leftViewMode = .always
        return ed
    }()
    
    let password: UITextField = {
        let ed = UITextField()
        ed.backgroundColor = .white
        ed.placeholder = "Entre com sua senha"
        ed.translatesAutoresizingMaskIntoConstraints = false
        ed.layer.cornerRadius = 10
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: ed.frame.height))
        ed.leftView = paddingView
        ed.leftViewMode = .always
        return ed
    }()
        
    lazy var send: UIButton = {
        let btn = UIButton()
        btn.setTitle("Entrar", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(sendDidTap), for: .touchUpInside)
        return btn
    }()
    
    lazy var register: UIButton = {
        let btn = UIButton()
        btn.setTitle("Criar conta", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemGray
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(regiterDidTap), for: .touchUpInside)
        return btn
    }()
    
    var viewModel: SignInViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5
        
        navigationItem.title = "Login"
        
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(send)
        view.addSubview(register)
        
        let emailConstraints = [
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            email.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -20),
            email.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            email.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        let passwordConstraints = [
            password.leadingAnchor.constraint(equalTo: email.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: email.trailingAnchor),
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10.0),
            password.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        let sendConstraints = [
            send.leadingAnchor.constraint(equalTo: password.leadingAnchor),
            send.trailingAnchor.constraint(equalTo: password.trailingAnchor),
            send.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10.0),
            send.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        let registerConstraints = [
            register.leadingAnchor.constraint(equalTo: send.leadingAnchor),
            register.trailingAnchor.constraint(equalTo: send.trailingAnchor),
            register.topAnchor.constraint(equalTo: send.bottomAnchor, constant: 10.0),
            register.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        NSLayoutConstraint.activate(emailConstraints)
        NSLayoutConstraint.activate(passwordConstraints)
        NSLayoutConstraint.activate(sendConstraints)
        NSLayoutConstraint.activate(registerConstraints)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(_ view: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    @objc func sendDidTap(_ sender: UIButton){
        viewModel?.send()
    }
    
    @objc func regiterDidTap(_ sender: UIButton){
        viewModel?.goToSignUp()
    }

}

//Observers
extension SignInViewController: SignInViewModelDelegate {
    func viewModelDidChanged(state: SignInState){
        switch(state) {
        case .none:
            break
        case .loading:
            break
        case .goToHome:
            viewModel?.goToHome()
            break
        case .error(let msg):
            let alert = UIAlertController(title: "Titulo", message: msg, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
            break
        }

    }
}

