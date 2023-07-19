//
//  LogcatModel.swift
//  Fake-A-Chip
//
//  Created by Mike Hall on 29/06/2023.
//

import Foundation
import SwiftUI

public enum LogcatType: CaseIterable {
    case warning, info, error, network
    
    public func title() -> String {
        switch self {
        case .warning:
            return "Warning"
        case .info:
            return "Info"
        case .error:
            return "ERROR"
        case .network:
            return "Network"
        }
    }
    
    public func colour() -> Color {
        switch self {
        case .warning:
            return .orange
        case .info:
            return .black
        case .error:
            return .red
        case .network:
            return .green
        }
    }
}

public struct LogcatModel {
    public init(type: LogcatType, date: Date, message: String){
        self.type = type
        self.date = date
        self.message = message
    }
    public let type: LogcatType
    public let date: Date
    public let message: String
}
