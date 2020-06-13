//
//  File.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//

import UIKit

public extension UIViewController {
    
    func presentAlert(title: String, message: String) {
        let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}
