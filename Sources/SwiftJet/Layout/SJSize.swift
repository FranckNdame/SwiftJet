//
//  File.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//

import UIKit

public struct SJSize {
    public enum SizeType {
        case unknown, all, small, medium, large, xlarge, x
        case iPadSmall, iPadMedium, iPadLarge
    }
    let type: SJSize.SizeType
    let x: CGFloat
    let y: CGFloat
    let width: CGFloat
    let height: CGFloat
    let size: CGFloat
    
    // MARK: - Private methods
    
    private init(type: SJSize.SizeType, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, size: CGFloat) {
        self.type = type
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.size = size
    }
    
    // MARK: - Public methods
    
    public static func == (lhs: SJSize, rhs: SJSize) -> Bool {
        let lhsSize = lhs.type
        let rhsSize = rhs.type
        
        // Check if we have an unknown case
        if case .unknown = lhsSize { return false }
        else if case .unknown = rhsSize { return false }
        
        // iPhone Types
        if case .all = lhsSize, case .all = rhsSize { return true }
        else if case .small = lhsSize, case .small = rhsSize { return true }
        else if case .medium = lhsSize, case .medium = rhsSize { return true }
        else if case .large = lhsSize, case .large = rhsSize { return true }
        else if case .xlarge = lhsSize, case .xlarge = rhsSize { return true }
        else if case .x = lhsSize, case .x = rhsSize { return true }
            
        // iPad Types
        else if case .iPadSmall = lhsSize, case .iPadSmall = rhsSize { return true }
        else if case .iPadMedium = lhsSize, case .iPadMedium = rhsSize { return true }
        else if case .iPadLarge = lhsSize, case .iPadLarge = rhsSize { return true }
        
        return false
    }

    public static func size(fromSizes sizes: [SJSize]) -> SJSize {
        var sizeToReturn: SJSize = self.unknown()
        guard sizes.count >= 1 else { return sizeToReturn }
        
        if sizes.count == 1 {
            if let size = sizes.first {
                sizeToReturn = size
            }
        }
        else {
            let screenSize = UIDevice.screenSize
            for size in sizes where screenSize == size {
                    sizeToReturn = size
            }
        }
        
        return sizeToReturn
    }
    
    // MARK: - Size
    
    public static func size(type: SJSize.SizeType = .unknown,
                            x: CGFloat = 0.0,
                            y: CGFloat = 0.0,
                            width: CGFloat = 0.0,
                            height: CGFloat = 0.0,
                            size: CGFloat = 0.0) -> SJSize  {
        return self.init(type: type, x: x, y: y, width: width, height: height, size: size)
    }
    
    // MARK: - Unknown
    
    public static func unknown(size: CGSize) -> SJSize {
        return self.unknown(width: size.width, height: size.height)
    }
    
    public static func unknown(frame: CGRect) -> SJSize  {
        return self.unknown(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
    }
    
    public static func unknown(x: CGFloat = 0.0, y: CGFloat = 0.0 , width: CGFloat = 0.0, height: CGFloat = 0.0, size: CGFloat = 0.0) -> SJSize  {
        return self.init(type: .unknown, x: x, y: y, width: width, height: height, size: size)
    }
    
    // MARK: - All
    
    public static func all(size: CGSize) -> SJSize {
        return self.all(width: size.width, height: size.height)
    }
    
    public static func all(frame: CGRect) -> SJSize  {
        return self.all(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
    }
    
    public static func all(x: CGFloat = 0.0, y: CGFloat = 0.0 , width: CGFloat = 0.0, height: CGFloat = 0.0, size: CGFloat = 0.0) -> SJSize  {
        return self.init(type: .all, x: x, y: y, width: width, height: height, size: size)
    }
    
    // MARK: - Small
    
    public static func small(size: CGSize) -> SJSize {
        return self.small(width: size.width, height: size.height)
    }
    
    public static func small(frame: CGRect) -> SJSize  {
        return self.small(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
    }
    
    public static func small(x: CGFloat = 0.0, y: CGFloat = 0.0 , width: CGFloat = 0.0, height: CGFloat = 0.0, size: CGFloat = 0.0) -> SJSize  {
        return self.init(type: .small, x: x, y: y, width: width, height: height, size: size)
    }
    
    // MARK: - Medium
    
    public static func medium(size: CGSize) -> SJSize {
        return self.medium(width: size.width, height: size.height)
    }
    
    public static func medium(frame: CGRect) -> SJSize  {
        return self.medium(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
    }
    
    public static func medium(x: CGFloat = 0.0, y: CGFloat = 0.0 , width: CGFloat = 0.0, height: CGFloat = 0.0, size: CGFloat = 0.0) -> SJSize  {
        return self.init(type: .medium, x: x, y: y, width: width, height: height, size: size)
    }
    
    // MARK: - Large
    
    public static func large(size: CGSize) -> SJSize {
        return self.large(width: size.width, height: size.height)
    }
    
    public static func large(frame: CGRect) -> SJSize  {
        return self.large(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
    }
    
    public static func large(x: CGFloat = 0.0, y: CGFloat = 0.0 , width: CGFloat = 0.0, height: CGFloat = 0.0, size: CGFloat = 0.0) -> SJSize  {
        return self.init(type: .large, x: x, y: y, width: width, height: height, size: size)
    }
    
    // MARK: - XLarge
    
    public static func xlarge(size: CGSize) -> SJSize {
        return self.xlarge(width: size.width, height: size.height)
    }
    
    public static func xlarge(frame: CGRect) -> SJSize  {
        return self.xlarge(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
    }
    
    public static func xlarge(x: CGFloat = 0.0, y: CGFloat = 0.0 , width: CGFloat = 0.0, height: CGFloat = 0.0, size: CGFloat = 0.0) -> SJSize  {
        return self.init(type: .xlarge, x: x, y: y, width: width, height: height, size: size)
    }
    
    // MARK: - X
    
    public static func x(size: CGSize) -> SJSize {
        return self.x(width: size.width, height: size.height)
    }
    
    public static func x(frame: CGRect) -> SJSize  {
        return self.x(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
    }
    
    public static func x(x: CGFloat = 0.0, y: CGFloat = 0.0 , width: CGFloat = 0.0, height: CGFloat = 0.0, size: CGFloat = 0.0) -> SJSize  {
        return self.init(type: .x, x: x, y: y, width: width, height: height, size: size)
    }
    
    // MARK: - iPad Small
    
    public static func iPadSmall(size: CGSize) -> SJSize {
        return self.iPadSmall(width: size.width, height: size.height)
    }
    
    public static func iPadSmall(frame: CGRect) -> SJSize  {
        return self.iPadSmall(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
    }
    
    public static func iPadSmall(x: CGFloat = 0.0, y: CGFloat = 0.0 , width: CGFloat = 0.0, height: CGFloat = 0.0, size: CGFloat = 0.0) -> SJSize  {
        return self.init(type: .iPadSmall, x: x, y: y, width: width, height: height, size: size)
    }
    
    // MARK: - iPad Medium
    
    public static func iPadMedium(size: CGSize) -> SJSize {
        return self.iPadMedium(width: size.width, height: size.height)
    }
    
    public static func iPadMedium(frame: CGRect) -> SJSize  {
        return self.iPadMedium(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
    }
    
    public static func iPadMedium(x: CGFloat = 0.0, y: CGFloat = 0.0 , width: CGFloat = 0.0, height: CGFloat = 0.0, size: CGFloat = 0.0) -> SJSize  {
        return self.init(type: .iPadMedium, x: x, y: y, width: width, height: height, size: size)
    }
    
    // MARK: - iPad Large
    
    public static func iPadLarge(size: CGSize) -> SJSize {
        return self.iPadLarge(width: size.width, height: size.height)
    }
    
    public static func iPadLarge(frame: CGRect) -> SJSize  {
        return self.iPadLarge(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
    }
    
    public static func iPadLarge(x: CGFloat = 0.0, y: CGFloat = 0.0 , width: CGFloat = 0.0, height: CGFloat = 0.0, size: CGFloat = 0.0) -> SJSize  {
        return self.init(type: .iPadLarge, x: x, y: y, width: width, height: height, size: size)
    }
}

