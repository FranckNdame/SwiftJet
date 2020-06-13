//
//  File.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//

import UIKit



public class SJFormHelper {
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .red
        return label
    }()
    
    private enum Title {
        enum Password: String {
            case isInvalid = "Invalid password"
            case noMatch = "Passwords do not match"
            case invalid = "Field is invalid"
        }
        enum TextField: String {
            case invalid = "Field is invalid"
        }
    }

    private enum Message {
        enum Password: String {
            case isInvalid = "Sorry, your password should be at least 6 characters long!"
            case noMatch = "Please make sure you passwords are identical"
        }
        enum TextField: String {
            case nilValue = "[Nil Pointer]: Textfield was not initialized"
        }
    }

    public enum SJCondition {
        case lessThan(Int)
        case greaterThan(Int)
        case contains(String)
    }
    
    var target: UIViewController?
    
    public init(target: UIViewController) {
        self.target = target
        target.view.addSubview(messageLabel)
    }
    
    public func isOverEighteen(dob: Date) -> Bool {
        let currentDate = Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: dob, to: currentDate)
        let age = ageComponents.year!
        return age >= 18
    }
    
    public func passwordIsValid(_ passwordString:String) -> Bool {
        guard let target = self.target else { return false  }
        if passwordString.count >= 6  { return true }
        else {
            target.presentAlert(
                title: Title.Password.isInvalid.rawValue,
                message: Message.Password.isInvalid.rawValue)
            return false
        }
    }
    
    public func passwordMatches(_ p1TextField:UITextField, _ p2TextField:UITextField) -> Bool {
        guard let target = self.target else { return false }
        guard let p1 = p1TextField.text, let p2 = p2TextField.text else {
            print(Message.TextField.nilValue.rawValue)
            return false
        }
        if passwordIsValid(p1) && p1 == p2  {
            return true
        }
        else {
            target.presentAlert(
                title: Title.Password.noMatch.rawValue,
                message: Message.Password.noMatch.rawValue)
            return false
        }
    }
    
    fileprivate func setLayoutDisplay(
        _ fieldViews: [UIView]?, _ index: Int, _ field: UITextField,
        _ state: UIView.State, message: String = String()) {
        guard let target = self.target else { return }
        messageLabel.removeAllConstraints()
        messageLabel.removeFromSuperview()
        target.view.addSubview(messageLabel)
        if let fieldViews = fieldViews {
            fieldViews[index].setLayoutDisplay(target, state, message, messageLabel: messageLabel)
        } else {
            field.setLayoutDisplay(target, state, message, messageLabel: messageLabel)
        }
    }
    
    public func fieldsAreValid(
        _ fields: [UITextField],
        conditions: [SJCondition] = [
        SJCondition.greaterThan(0),
        SJCondition.lessThan(50)
        ],
        fieldViews: [UIView]? = nil
    ) -> Bool {
        guard let target = self.target else { return false }
        for (index, field) in fields.enumerated() {
            guard let text = field.text else {
                print(Message.TextField.nilValue.rawValue)
                return false
            }
            for condition in conditions {
                switch condition {
                case .contains(let val):
                    if !text.contains(val) {
                        let message = "Entry must contain the '\(val)' character"
                        target.presentAlert(
                            title: Title.TextField.invalid.rawValue,
                            message: message)
                        setLayoutDisplay(fieldViews, index, field, .error, message: message)
                        return false
                    }
                    
                case .greaterThan(let val):
                    if text.count <= val {
                        let message = "Value must be greater than \(val) characters"
                        target.presentAlert(
                            title: Title.TextField.invalid.rawValue,
                            message: message)
                        setLayoutDisplay(fieldViews, index, field, .error, message: message)
                        return false
                    }
                case .lessThan(let val):
                    if text.count >= val {
                        let message = "Value must be less than \(val) characters"
                        target.presentAlert(
                            title: Title.TextField.invalid.rawValue,
                            message: message)
                        setLayoutDisplay(fieldViews, index, field, .error, message: message)
                        return false
                    }
                }
            }
            setLayoutDisplay(fieldViews, index, field, .valid)
        }
        return true
    }
}
