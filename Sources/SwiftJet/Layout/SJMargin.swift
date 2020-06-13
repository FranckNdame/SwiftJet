//
//  File.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//

import UIKit

/// A collection of common constants for margins and sizes
public enum SJMargin {
    // MARK: - Components
    public enum Components {
        // MARK: - Padding
        public enum Padding {
            //For cohesive design Most padding used are multiple of 8
            static let tiny: CGFloat = 4
            static let small: CGFloat = 8
            static let medium: CGFloat = 16
            static let semiLarge: CGFloat = 24
            static let large: CGFloat = 32
            static let extraLarge: CGFloat = 40
            static let big: CGFloat = 48
        }
        
        // MARK: Line limit
        public enum LineLimit {
            static let none: Int = 0
            static let single: Int = 1
            static let double: Int = 2
            static let triple: Int = 3
            static let quadruple: Int = 4
            static let quintuple: Int = 5
        }
        
        // MARK: - Button
        public enum Button {
            enum Size {
                static let medium: CGSize = .init(width: 40, height: 40)
                static let small: CGSize = .init(width: 34, height: 34)
            }
        }
        
        // MARK: - Filter
        public enum Filter {
            static let height: CGFloat = 68
            static let cellSize: CGSize = .init(width: 103, height: 36)
            static let padding: CGFloat = Padding.medium
        }
        
        public static let edgeMargin: CGFloat = 16
    }

}
