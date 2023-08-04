//
//  ForgotServiceConfiguration.swift
//  MangaSocial
//
//  Created by Diem Tran on 26/07/2023.
//

import Foundation

enum ForgotServiceConfiguration {
    case forgot(email:String,
                password:String,
                confirmpassword:String)
}

extension ForgotServiceConfiguration: Configuration {
    
    var baseURL: String {
        switch self {
        case .forgot:
            return Constant.Server.baseAPIURL
            
        }
    }
    
    var path: String {
        switch self {
        case .forgot:
            return "forgot-password"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .forgot:
            return .patch

        }
    }
    
    var task: Task {
        switch self {
        case .forgot(let email,
                     let password,
                     let confirmpassword):
            let param = ["email": email,
                         "password": password,
                         "confirmpassword": confirmpassword]
            return .requestParameters(parameters: param)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .forgot:
            return [:]
        }
    }
    
    var data: Data? {
        switch self {
        case .forgot:
            return nil
            
        }
    }
}
