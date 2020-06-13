//
//  File.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//

import UIKit

private enum Title {
    enum Password: String {
        case isInvalid = "Invalid password"
        case noMatch = "Passwords do not match"
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

enum SJCondition {
    case lessThan(Int)
    case greaterThan(Int)
    case contains(String)
}

class SJFormHelper {
    
    enum VerificationType { case name }
    var target: UIViewController?
    
    init(target: UIViewController) {
        self.target = target
    }
    
    public func isOverEighteen(dob: Date) -> Bool {
        let currentDate = Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: dob, to: currentDate)
        let age = ageComponents.year!
        return age >= 18
    }
    
    internal func passwordIsValid(_ passwordString:String) -> Bool {
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
    
    public func fieldsAreValid(
        _ fields: [UITextField],
        conditions: [SJCondition] = [
        SJCondition.greaterThan(0),
        SJCondition.lessThan(50)
        ]) -> Bool {
        guard let target = self.target else { return false }
        for field in fields {
            let placeholder = field.placeholder.safeunwrap(withDefault: "Field")
            guard let text = field.text else {
                print(Message.TextField.nilValue.rawValue)
                return false
            }
            for condition in conditions {
                switch condition {
                case .contains(let val):
                    if !text.contains(val) {
                        target.presentAlert(
                            title: placeholder + " is invalid",
                            message: "\(placeholder) must contain \(val)")
                        field.setLayoutDisplay(.error)
                        return false
                    }
                    
                case .greaterThan(let val):
                    if text.count <= val {
                        target.presentAlert(
                            title: placeholder + " is invalid",
                            message: "\(placeholder) must be greater than \(val) characters")
                        field.setLayoutDisplay(.error)
                        return false
                    }
                case .lessThan(let val):
                    if text.count >= val {
                        target.presentAlert(
                            title: placeholder + " is invalid",
                            message: "\(placeholder) must be less than \(val) characters")
                        field.setLayoutDisplay(.error)
                        return false
                    }
                }
            }
            field.setLayoutDisplay(.valid)
        }
        return true
    }
}
