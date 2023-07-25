//
//  LoginAPI.swift
//  MangaSocial
//
//  Created by Diem Tran on 25/07/2023.
//

import Foundation

class LoginAPI: BaseAPI<LoginServiceConfiguration> {
    static let shared = LoginAPI()
    
    func login(email: String,
               password: String,
               completionHandler: @escaping (Result<LoginModel, ServiceError>) -> Void) {
        fetchData(configuration: .login(email: email,
                                        password: password),
                  responseType: LoginModel.self) { result in
            completionHandler(result)
        }
    }
}
