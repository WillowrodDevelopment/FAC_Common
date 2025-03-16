//
//  String+Helpers.swift
//  Fake-A-Chip
//
//  Created by Mike Hall on 20/05/2023.
//

import Foundation
import SwiftUI

public extension String {
    public func padded(size: Int = 2) -> String {
        let len = self.count
        var rtrn = self
        if len <= size {
            for _ in len..<size{
                rtrn = "0\(rtrn)"
            }
        }
        return rtrn
    }
    
    public func characterAt(_ i: Int) -> String {
      return String(Array(self)[i])
    }
    
    func reduce() -> String {
        if self.count > 1 {
            var str = self
            str.removeLast()
            return str
        }
        return self
    }
    
    func sysImage() -> String {
        return "\(Image(systemName: self))"
    }
    
    func image() -> String {
        return "\(Image(self))"
    }
}
