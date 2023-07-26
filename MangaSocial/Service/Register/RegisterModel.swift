//
//  RegisterModel.swift
//  MangaSocial
//
//  Created by Diem Tran on 26/07/2023.
//

import Foundation

struct RegisterModel : Codable {
    let account: DataRegister?
    let message: String
}

struct DataRegister : Codable {
    let email : String
}
