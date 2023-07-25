//
//  LoginModel.swift
//  MangaSocial
//
//  Created by Diem Tran on 25/07/2023.
//

import Foundation

struct LoginModel: Codable {
    let account: Account?
    let ketqua: String?
}

struct Account: Codable {
    let email: String
    let id_user: Int
    let jwt: String
    let password: String
}
