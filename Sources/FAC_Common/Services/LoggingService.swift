//
//  LoggingService.swift
//  Fake-A-Chip
//
//  Created by Mike Hall on 29/06/2023.
//

import Foundation
import FAC_Common

@Observable
public class LoggingService {
    public var logcat: [LogcatModel] = []
    public var isLogging = true
    public var count = 0
    public var isLoggingProcessor = false
    
    public var printToConsole = false
    
    public static let shared = LoggingService()
    
    public func logError(_ message: String) {
        log(type: .error, message: message)
    }
    
    public func logInfo(_ message: String) {
        log(type: .info, message: message)
    }
    
    public func logWarning(_ message: String) {
        log(type: .warning, message: message)
    }
    
    public func logNetwork(_ message: String) {
        log(type: .network, message: message)
    }
    
    public func log(_ message: String) {
        log(type: .info, message: message)
    }
    
    public func logProcessor(_ pc: UInt16, opcode: String, message: String?) {
        if isLoggingProcessor {
            if let message {
                log(type: .info, message: "\(pc.hex()) - \(opcode) - \(message)")
            } else {
                log(type: .info, message: "\(pc.hex()) - \(opcode)")
                
            }
        }
    }
    
    public func logProcessor(message: String) {
        if isLoggingProcessor {
                log(type: .info, message: "PC \(message)")
        }
    }
    
    private func log(type: LogcatType, message: String) {
        
            if printToConsole {
                print("\(type.symbol()) - \(message)")
            }
        if isLogging {
                DispatchQueue.main.async {
                    if self.logcat.count > 1000 {
                        self.logcat.removeSubrange(...10)
                    }
                    self.logcat.append(LogcatModel(type: type, date: Date(), message: message))
                    self.count += 1
                }
            }
    }
    
    public func clear() {
        logcat.removeAll()
    }
}

public extension LogcatType {
    
    func symbol() -> String {
        switch self {
        case .warning:
            return "🟠"
        case .info:
            return "🟢"
        case .error:
            return "🔴"
        case .network:
            return "🔵"
        }
    }
}
