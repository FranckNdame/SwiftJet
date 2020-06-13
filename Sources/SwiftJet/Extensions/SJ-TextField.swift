//
//  File.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//

import UIKit

extension UITextField {
    enum State { case valid, error }
    func setLayoutDisplay(_ state: State) {
        layer.borderWidth = 2
        layer.borderColor = state == .error ? UIColor.red.cgColor : UIColor.clear.cgColor
    }
}
