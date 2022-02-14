//
//  UITextField.swift
//  SyncLocalToCloud
//
//  Created by Brian Veitch on 2/12/22.
//

import Foundation
import UIKit


extension UITextField {
    
    func setPadding( _ left: CGFloat, _ right: CGFloat) {
        setLeftPaddingPoints(left)
        setRightPaddingPoints(right)
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
