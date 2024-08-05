//
//  File.swift
//  
//
//  Created by Mike Hall on 24/07/2024.
//

import Foundation

public extension Int {
    public func hex() -> String {
        return String(self, radix: 16).padded(size: 2)
    }
}
