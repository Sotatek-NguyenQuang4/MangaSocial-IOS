//
//  RegisterAPI.swift
//  MangaSocial
//
//  Created by Diem Tran on 26/07/2023.
//

import Foundation

class RegisterAPI: BaseAPI<RegisterServiceConfiguration> {
    static let shared = RegisterAPI()
    
    func register(email: String,
                  password: String,
                  completionHandler: @escaping (Result<RegisterModel, ServiceError>) -> Void) {
        fetchData(configuration: .register(email: email,
                                           password: password),
                                           responseType: RegisterModel.self) { result in
                                           completionHandler(result)
        }
    }
}
