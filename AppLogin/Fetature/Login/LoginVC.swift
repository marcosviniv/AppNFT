//
//  ViewController.swift
//  AppLogin
//
//  Created by Marcos Vinícius Vieira on 15/11/24.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    var auth: Auth?
    var alert: AlertController?
    
    override func loadView() {
        loginScreen = LoginScreen()
        alert = AlertController(controller: self)
        view = loginScreen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        auth = Auth.auth()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldsDelegate(delegate: self)
        isEnableLoginButton(false)
        
    }
    
    func validateTextFields() {
        if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) && (loginScreen?.passwordTextField.text ?? "").isValid(validType: .passoword) {
            isEnableLoginButton(true)
        }   else {
            isEnableLoginButton(false)
        }
    }
    
    func isEnableLoginButton(_ isEnable: Bool) {
        if isEnable {
            loginScreen?.loginButton.setTitleColor(UIColor.white, for: .normal)
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.subImageView.alpha = 1
        } else {
            loginScreen?.loginButton.setTitleColor(UIColor.lightGray, for: .normal)
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.subLoginImageView.alpha = 0.4
        }
        
    }
}
    extension LoginVC: LoginScreenProtocol {
        func tappedLoginButton() {
            auth?.signIn(withEmail: loginScreen?.emailTextField.text ?? "", password: loginScreen?.passwordTextField.text ?? "", completion: { user, error in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                    self.alert?.getAlert(title: "Falha no Login", message: error?.localizedDescription ?? "", completion: {
                        print("Botão pressionado")
                        })
                } else {
                    // Sucesso
                    print("Sucesso")
                }
            })
        }
    }
    
    extension LoginVC: UITextFieldDelegate {
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            if textField.text?.isEmpty ?? false {
                textField.layer.borderWidth = 1.5
                textField.layer.borderColor = UIColor.red.cgColor
            } else {
                switch textField {
                case self.loginScreen?.emailTextField:
                    if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) {
                        loginScreen?.emailTextField.layer.borderWidth = 1
                        loginScreen?.emailTextField.layer.borderColor = UIColor.white.cgColor
                    } else {
                        loginScreen?.emailTextField.layer.borderWidth = 1.5
                        loginScreen?.emailTextField.layer.borderColor = UIColor.red.cgColor
                    }
                    
                case self.loginScreen?.passwordTextField:
                    if (loginScreen?.passwordTextField.text ?? "").isValid(validType: .passoword) {
                        loginScreen?.passwordTextField.layer.borderWidth = 1
                        loginScreen?.passwordTextField.layer.borderColor = UIColor.white.cgColor
                    } else {
                        loginScreen?.passwordTextField.layer.borderWidth = 1.5
                        loginScreen?.passwordTextField.layer.borderColor = UIColor.red.cgColor
                    }
                default:
                    break
                }
            }
            validateTextFields()
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
    }
