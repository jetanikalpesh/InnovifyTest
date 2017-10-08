//
//  AppUtility.swift
//  InnovifyTest
//
//  Created by jetani kalpesh on 08/10/17.
//  Copyright © 2017 sigmacoder. All rights reserved.
//

import Foundation

enum InnovifyTestError : Error {
    
    case invalidDataObject
    case errorMessage(String)
    
    
    var localizedDescription: String{
        switch self {
        case .invalidDataObject:
            return "Invalid data object"
        case .errorMessage(let message):
            return message
        }
    }
    
    var innovifyDebugMessage : String {
        
        switch self {
        case .invalidDataObject:
            return "Innovofy Debug Message : Invalid data object"
        case .errorMessage(let message):
            return "Innovify Debug Message : \(message)"
        }

    }
    
    var code : Int{
        switch self{
        case .invalidDataObject:
            return -100
        case .errorMessage:
            return 0
        }
    }
    
    func printError(){
        print("Error > ", self.innovifyDebugMessage)
    }
}
