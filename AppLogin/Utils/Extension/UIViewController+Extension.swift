//
//  UIViewController+Extension.swift
//  AppLogin
//
//  Created by Marcos Vinícius Vieira on 07/12/24.
//

import Foundation
import UIKit

extension UIViewController {
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
