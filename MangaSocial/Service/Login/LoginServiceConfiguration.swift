//
//  LoginServiceConfiguration.swift
//  MangaSocial
//
//  Created by Diem Tran on 25/07/2023.
//

import Foundation
import Alamofire

enum LoginServiceConfiguration {
    case login(email: String,
               password: String)
}

extension LoginServiceConfiguration: Configuration {
    
    var baseURL: String {
        switch self {
        case .login:
            return Constant.Server.baseAPIURL
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "login"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .login(let email,
                    let password):
            let parameters = [
                "email": email,
                "password": password ]
            return .requestParameters(parameters: parameters)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .login:
            return [:]
        }
    }
    
    var data: Data? {
        switch self {
        case .login:
            return nil
        }
    }
}
