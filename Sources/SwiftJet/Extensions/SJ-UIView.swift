//
//  File.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//

#if !os(macOS)
import UIKit

public struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

/// Anchor extensions
public extension UIView {
    
    @available(iOS 9.0, *)
    @discardableResult
    func anchor(superView: UIView? = nil,
                       top: NSLayoutYAxisAnchor? = nil,
                       leading: NSLayoutXAxisAnchor? = nil,
                       bottom: NSLayoutYAxisAnchor? = nil,
                       trailing: NSLayoutXAxisAnchor? = nil,
                       padding: UIEdgeInsets = .zero,
                       size: CGSize = .zero) -> AnchoredConstraints {
        if let superView = superView {
            superView.addSubview(self)
        }
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top,
         anchoredConstraints.leading,
         anchoredConstraints.bottom,
         anchoredConstraints.trailing,
         anchoredConstraints.width,
         anchoredConstraints.height].forEach { $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    @available(iOS 9.0, *)
    func fillSuperview(superView: UIView? = nil, padding: UIEdgeInsets = .zero) {
        if let superView = superView {
            superView.addSubview(self)
        }
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    @available(iOS 9.0, *)
    func centerInSuperview(superView: UIView? = nil, size: CGSize = .zero, vOffset:CGFloat = 0, hOffset:CGFloat = 0) {
        if let superView = superView {
            superView.addSubview(self)
        }
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor, constant: hOffset).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor, constant: vOffset).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    @available(iOS 9.0, *)
    func centerRelativeTo(
        xAxisView: UIView? = nil, xConst: CGFloat = 0.0,
        yAxisView: UIView? = nil, yConst: CGFloat = 0.0)
    {
        translatesAutoresizingMaskIntoConstraints = false
        if let xAxisView = xAxisView {
            centerXAnchor.constraint(equalTo: xAxisView.centerXAnchor, constant: xConst).isActive = true
        }
        
        if let yAxisView = yAxisView {
            centerYAnchor.constraint(equalTo: yAxisView.centerYAnchor, constant: yConst).isActive = true
        }
    }

}

public extension UIEdgeInsets {
     init(_ top: CGFloat = 0, _ left: CGFloat = 0, _ bottom: CGFloat = 0, _ right: CGFloat = 0) {
        self.init(top: top, left: left, bottom: bottom, right: right)
    }

}


/// Shadow extensions
public extension UIView {
    func addShadow(
        radius: CGFloat = 16.0, opacity: Float = 0.1,
        Yoffset: CGFloat = 7, color: UIColor = .black
    ) {
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: 0, height: Yoffset)
        layer.shadowColor  = color.cgColor
    }
}

/// Shadow IB extensions
public extension UIView {
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
}

public extension UIView {
    enum State { case valid, error }
    func setLayoutDisplay(_ state: State) {
        layer.borderWidth = 2
        layer.borderColor = state == .error ? UIColor.red.cgColor : UIColor.clear.cgColor
    }
}

#endif
