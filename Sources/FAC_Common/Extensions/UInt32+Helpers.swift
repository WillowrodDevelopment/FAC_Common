//
//  File.swift
//  FAC_Common
//
//  Created by Mike Hall on 13/12/2024.
//

import Foundation

public extension UInt32 {
    init(byte0: UInt8, byte1: UInt8, byte2: UInt8, byte3: UInt8) {
        self.init(
            UInt32(byte3) * UInt32(16777216) +
            UInt32(byte2) * UInt32(65536) +
            UInt32(byte1) * UInt32(256) +
            UInt32(byte0)
        )
    }
    
    public func toInt32() -> Int32 {
        return self > 0x7fffffff ? -Int32(~self + 1) : Int32(self)
    }
}


public extension Int32 {
    init(byte0: UInt8, byte1: UInt8, byte2: UInt8, byte3: UInt8) {
        self.init(UInt32(byte0: byte0, byte1: byte1, byte2: byte2, byte3: byte3).toInt32())
    }
}
