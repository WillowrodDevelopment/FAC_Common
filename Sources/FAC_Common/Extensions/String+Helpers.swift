//
//  String+Helpers.swift
//  Fake-A-Chip
//
//  Created by Mike Hall on 20/05/2023.
//

import Foundation

public extension String {
    public func padded(size: Int = 2) -> String {
        let len = self.count
        var rtrn = self
        for _ in len..<size{
            rtrn = "0\(rtrn)"
        }
        return rtrn
    }
}
