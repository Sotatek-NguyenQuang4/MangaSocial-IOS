//
//  ForgotModel.swift
//  MangaSocial
//
//  Created by Diem Tran on 26/07/2023.
//

import Foundation

struct ForgotPassModel: Codable {
    let account: Dataforgot?
    let messega: String
}

struct Dataforgot: Codable {
    let email: String
}
