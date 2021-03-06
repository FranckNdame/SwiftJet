//
//  File.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//

import Foundation

public extension Optional where Wrapped == String {
    var safeunwrap: String {
        return self ?? ""
    }
    
    func safeunwrap(withDefault: String) -> String {
        return self ?? ""
    }
}

public extension Optional where Wrapped == Int {
    var safeunwrap: Int {
        return self ?? 0
    }
}

public extension Optional where Wrapped == Bool {
    var safeunwrap: Bool {
        return self ?? false
    }
}

public extension Optional where Wrapped == Date {
    var safeunwrap: Date {
        return self ?? Date()
    }
}

public extension Optional where Wrapped == [Any] {
    var safeunwrap: [Any] {
        return self ?? []
    }
}


