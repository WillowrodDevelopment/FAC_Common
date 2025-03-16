//
//  File.swift
//  FAC_Common
//
//  Created by Mike Hall on 10/03/2025.
//

import Foundation

public func wordFrom(low: UInt8, high: UInt8) -> UInt16 {
    return (UInt16(high) << 8) | UInt16(low)
}
