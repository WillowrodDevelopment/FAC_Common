//
//  RAM.swift
//  FAC_Common
//
//  Created by Mike Hall on 26/03/2025.
//

public actor RAM {
    var main: [UInt8] = Array(Array(repeating: 0x00, count: 0x10000))
    var blocks: [[UInt8]] = []
    var rom: [UInt8] = []
    var romBlocks: [[UInt8]] = []
    
    public init() {
        
    }
    
    public func poke(location: UInt16, value: UInt8) async {
        main[Int(location)] = value
    }

    public func peek(location: UInt16) async -> UInt8 {
        return main[Int(location)]
    }
    
    public func peekBlock(location: UInt16, count: Int) async -> [UInt8] {
        let locationInt = Int(location)
        let safeRange = locationInt + count <= main.count ? locationInt + count : main.count
        return Array(main[locationInt...safeRange])
    }
    
    public func poke(block: Int, location: UInt16, value: UInt8) async {
        blocks[block][Int(location)] = value
    }

    public func peek(block: Int, location: UInt16) async -> UInt8 {
        return blocks[block][Int(location)]
    }
    
    public func peekBlock(block: Int, location: UInt16, count: Int) async -> [UInt8] {
        let locationInt = Int(location)
        let safeRange = locationInt + count <= blocks[block].count ? locationInt + count : blocks[block].count
        return Array(blocks[block][locationInt...safeRange])
    }
    
    public func romPeek(location: UInt16) async -> UInt8 {
        return rom[Int(location)]
    }
    
    public func romPeek(block: Int, location: UInt16) async -> UInt8 {
        return romBlocks[block][Int(location)]
    }
    
    public func romPeekBlock(block: Int, location: UInt16, count: Int) async -> [UInt8] {
        let locationInt = Int(location)
        let safeRange = locationInt + count <= romBlocks[block].count ? locationInt + count : romBlocks[block].count
        return Array(romBlocks[block][locationInt...safeRange])
    }
    
    public func reset() async {
        main = Array(repeating: 0x00, count: 0x10000)
    }
    
    public func poke(from: UInt16, with: [UInt8]) async {
        for i in Int(from)..<Int(from) + with.count {
            if i < main.count {
                main[i] = with[i - Int(from)]
            }
        }
    }
    
}
