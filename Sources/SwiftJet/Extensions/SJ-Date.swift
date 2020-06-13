//
//  File.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//
import Foundation

public extension Date {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 4 * week
        
        let quotient: Int
        let unit: String
        
        if secondsAgo < minute {
            quotient = secondsAgo
            unit = "second"
        } else if  secondsAgo < hour {
            quotient = secondsAgo / minute
            unit = "min"
        } else if  secondsAgo < day {
            quotient = secondsAgo / hour
            unit = "hour"
        } else if  secondsAgo < week {
            quotient = secondsAgo / day
            unit = "day"
        } else if  secondsAgo < month {
            quotient = secondsAgo / week
            unit = "week"
        } else {
            quotient = secondsAgo / month
            unit = "month"
        }
        
        return "\(quotient) \(unit)\(quotient == 1 ? "" : "s") ago"
    }
}

public extension TimeInterval {
    // builds string in app's labels format 00:00.0
    func stringFormatted() -> String {

        let interval = Int(self)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

public extension String {
    var toDate: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.date(from: self)!
    }
}

