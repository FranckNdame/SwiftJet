//
//  SJ-Bundle.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 17/06/2020.
//

import Foundation

public extension Bundle {
    
    static func loadView<T: Reusable>(fromReusableClass class: T) -> T {
        if let view = Bundle.main.loadNibNamed(T.reuseIdentifier, owner: nil, options: nil)?.first as? T {
            return view
        }

        fatalError("Could not load view with type " + T.reuseIdentifier)
    }
    

    static func loadView<T>(fromNib name: String, withType type: T.Type) -> T {
        if let view = Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as? T {
            return view
        }

        fatalError("Could not load view with type " + String(describing: type))
    }
}
