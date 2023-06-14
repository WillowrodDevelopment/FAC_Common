//
//  UInt8+Helpers.swift
//  Fake-A-Chip
//
//  Created by Mike Hall on 20/05/2023.
//

import Foundation

public extension UInt8 {

    public func source() -> UInt8 {
        return self & 0x07
    }

    public func destination() -> UInt8 {
        return self & 0x38
    }

    public func clear(bit: Int) -> UInt8 {
        return (self & ~(1 << bit))
    }

    public func set(bit: Int) -> UInt8 {
        return (self | (1 << bit))
    }

    public func isSet(bit: Int) -> Bool {
        return self & (1 << bit) > 0
    }

    public func set(bit: Int, value: Bool) -> UInt8 {
        if (value){
            return set(bit: bit)
        } else {
            return clear(bit: bit)
        }
    }

    public func twosCompliment() -> UInt8 {
        return ~self &+ 1
    }

    public func lowerNibble() -> UInt8 {
        return self & 15
    }

    public func upperNibble() -> UInt8 {
        return (self >> 4) & 15
    }

    public func hex() -> String {
        return String(self, radix: 16).padded(size: 2)
    }

    public func bin() -> String {
        return String(self, radix: 2).padded(size: 8)
    }

    public func rlc() -> (value: UInt8, carryMask: UInt8) {
        let shouldCarry: UInt8 = (self & 0x80) > 0 ? 0x01 : 0x00
        return (value: self << 1 | shouldCarry , carryMask: shouldCarry)
    }

    public func rrc() -> (value: UInt8, carryMask: UInt8) {
        let carry = self & 0x01
        return (value: self >> 1 | carry > 0 ? 0x80 : 0x00, carryMask: carry)
    }

    public func rl(_ cMaskIn: UInt8) -> (value: UInt8, carryMask: UInt8) {
        let shouldCarry = (self & 0x80) > 0
        return (value: self << 1 | cMaskIn, carryMask: shouldCarry ? 0x01 : 0x00)
    }

    public func rr(_ cMaskIn: UInt8) -> (value: UInt8, carryMask: UInt8) {
        let carry = self & 0x01
        return (value: self >> 1 | cMaskIn, carryMask: carry)
    }

    public func bcdCorrect(_ isHalfCarry: Bool) -> (value: UInt8, carryMask: UInt8) {
        var temp = self
        var carry: UInt8 = 0x00
        if isHalfCarry || temp.lowerNibble() > 0x09 {
            temp = temp &+ 0x06
            carry = carry | 0x10 // half carry?
        }
        if temp.upperNibble() > 0x09 {
            temp = temp &+ 0x60
            carry = carry | 0x01
        }
        return (value: temp, carryMask: carry)
    }
    
}
