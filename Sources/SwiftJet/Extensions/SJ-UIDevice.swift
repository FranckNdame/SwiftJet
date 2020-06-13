//
//  File.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//

import UIKit

// MARK: - STNDevice

public typealias SJDevice = UIDevice
extension SJDevice {
    // MARK: - Class Methods
    class var screenSize: SJSize {
        let bounds = UIScreen.main.nativeBounds
        switch bounds.height {
        case 960.0:
            return .small(frame: bounds)    // iPhone 4/4s
        case 1136.0:
            return .medium(frame: bounds)  // iPhone 5/5S/5C
        case 1334.0:
            return .large(frame: bounds)   // iPhone 6/6S/7/8
        case 2208.0:
            return .xlarge(frame: bounds)  // iPhone 6+/7+/8+
        case 2436.0:
            return .x(frame: bounds)       // iPhone X
        default:
            break
        }
        return .unknown()
    }
}
