//
//  Reusable.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//

import Foundation

import UIKit

/// Provides a default `reuseIdentifier` to the entities that conform to it.
public protocol Reusable {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
