//
//  File.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 17/06/2020.
//

import UIKit


public extension UIEdgeInsets {
    init(t: CGFloat = 0.0, l: CGFloat = 0.0, b: CGFloat = 0.0, r: CGFloat = 0.0) {
        self.init(top: t, left: l, bottom: b, right: r)
    }
}


public extension CGSize {
     init(_ w: CGFloat=0.0, _ h: CGFloat=0.0) {
        self.init(width: w, height: h)
    }
}
