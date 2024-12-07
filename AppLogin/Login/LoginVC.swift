//
//  ViewController.swift
//  AppLogin
//
//  Created by Marcos Vinícius Vieira on 15/11/24.
//

import UIKit

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    
    override func loadView() {
        loginScreen = LoginScreen()
        view = loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
