//
//  File.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//

import UIKit

public extension UITextField {
    enum State { case valid, error }
    
    @IBInspectable var padding: CGFloat {
        get {
            return 0.0
        } set {
            setPadding(newValue)
        }
    }
    
    func setLayoutDisplay(_ state: State) {
        layer.borderWidth = 2
        layer.borderColor = state == .error ? UIColor.red.cgColor : UIColor.clear.cgColor
    }
    
     func setPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

