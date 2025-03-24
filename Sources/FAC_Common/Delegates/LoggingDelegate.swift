//
//  LoggingDelegate.swift
//  FAC_Common
//
//  Created by Mike Hall on 23/03/2025.
//


public protocol LoggingDelegate {
    func logError(_ message: String)
    func logInfo(_ message: String)
    func logWarning(_ message: String)
    func logNetwork(_ message: String)
    func logProcessor(_ pc: UInt16, _ message: String)
    func log(_ message: String)
}
