//
//  File.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//

import UIKit

/// A collection of common constants for margins and sizes
enum SJMargin {
    // MARK: - Components
    enum Components {
        // MARK: - Padding
        enum Padding {
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
        enum LineLimit {
            static let none: Int = 0
            static let single: Int = 1
            static let double: Int = 2
            static let triple: Int = 3
            static let quadruple: Int = 4
            static let quintuple: Int = 5
        }
        
        // MARK: - Button
        enum Button {
            enum Size {
                static let medium: CGSize = .init(width: 40, height: 40)
                static let small: CGSize = .init(width: 34, height: 34)
            }
        }
        
        // MARK: - Filter
        enum Filter {
            static let height: CGFloat = 68
            static let cellSize: CGSize = .init(width: 103, height: 36)
            static let padding: CGFloat = Padding.medium
        }
        
        static let edgeMargin: CGFloat = 16
    }
    
    // MARK: - Screens
    enum Screens {
        // MARK: - Search Bar
        enum SearchBar {
            static let size: CGSize = .init(width: 0, height: 60)
        }
        // MARK: - Home
        enum Home {
            enum Columns {
                static let compactScreenWidth: Int = 2
                static let wideScreenWidth: Int = 4
            }
            enum CellSize {
                static let location: CGSize = CGSize(width: 103, height: 36)
                static let headerHeight: CGFloat = 150
                static let peopleHeight: CGFloat = 300
                static let carouselCardHeight: CGFloat = 170
            }
            enum NavigationBar {
                static let size: CGSize = .init(width: 0, height: 70)
            }
            enum LocationView {
                static let size: CGSize = .init(width: 0, height: 70)
            }
            enum SeparatorView {
                static let size: CGSize = .init(width: 0, height: 1)
            }
            enum Person {
                static let cellSpacing: CGFloat = 15
                static let stackViewSpacing: CGFloat = 10
                static let donationViewHeight: CGFloat = 105
                
                static let backgroundFistSize: CGSize = .init(width: 110, height: 110)
                
                enum Info {
                    static let locationContainerWidth: CGFloat = 50
                    static let ageConatinerWidth: CGFloat = 60
                    static let verticalSeperatorSize: CGSize = .init(width: 150, height: 1.5)
                    static let horizontalSeperatorSize: CGSize = .init(width: 1.5, height: 30)
                }
                enum News {
                    static let contentHeigh: CGFloat = 263
                    static let collectionViewWidth: CGFloat = 150
                }
                enum Media {
                    static let contentHeigh: CGFloat = 218
                }
                enum Photo {
                    static let imageBlurHeight: CGFloat = 420
                }
                enum Hashtag {
                    static let height: CGFloat = 160
                    static let collectionviewHeight: CGFloat = 40
                    static let collectionviewItemSize: CGSize = .init(width: 170, height: 35)
                }
                
            }
        }
        // Donation Details
        enum DonationDetails {
            static let horizontalPadding: CGFloat = 25
            static let intersectionSpacing: CGFloat = 18
        }
        
        // MARK: - About
        enum About {
            enum card {
                static let logoHeight: CGFloat = 24
                static let logoWidth: CGFloat = 24
                static let multiplier: CGFloat = 0.6
            }
            
            enum makeActionButton {
                static let width: CGFloat = 50
            }
        }
        
    }
}