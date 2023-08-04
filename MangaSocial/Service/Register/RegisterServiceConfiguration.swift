//
//  RegisterServiceConfiguration.swift
//  MangaSocial
//
//  Created by Diem Tran on 26/07/2023.
//

import Foundation

enum RegisterServiceConfiguration {
    case register(email: String,
                  password: String)
}

extension RegisterServiceConfiguration: Configuration {
    
    var baseURL: String {
        switch self {
        case .register:
            return Constant.Server.baseAPIURL
            
        }
    }
    
    var path: String {
        switch self {
        case .register:
            return "register"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .register:
            return .post
            
        }
    }
    
    var task: Task {
        switch self {
        case .register(let email,
                       let password):
            let param = ["email": email,
                         "password": password]
            return .requestParameters(parameters: param)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .register:
            return [:]
        }
    }
    
    var data: Data? {
        switch self {
        case .register:
            return nil
            
        }
    }
}
