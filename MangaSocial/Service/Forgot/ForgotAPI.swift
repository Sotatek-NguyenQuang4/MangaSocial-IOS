//
//  ForgotAPI.swift
//  MangaSocial
//
//  Created by Diem Tran on 26/07/2023.
//

import Foundation

class ForgotAPI: BaseAPI<ForgotServiceConfiguration> {
    static let shared = ForgotAPI()
    
    func forgot(email: String,
                password:String,
                confirmpassword:String,
                completionHandler: @escaping (Result<ForgotPassModel, ServiceError>) -> Void) {
        fetchData(configuration: .forgot(email: email,
                                         password: password,
                                         confirmpassword: confirmpassword),
                                         responseType: ForgotPassModel.self) { result in
                                         completionHandler(result)
        }
    }
}
