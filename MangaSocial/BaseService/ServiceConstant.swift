//
//  ServiceConstant.swift
//  Probit
//
//  Created by Beacon on 31/08/2022.
//

import Foundation

struct Constant {
    struct Server {
        static let baseAPIURL = Configs.share.env.baseURL
        static let imgAPIURL = Configs.share.env.imgAPIURL
    }
}

enum Header: String {
    case acceptType = "Accept"
    case contentType = "Content-Type"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

struct GenericResponse: Codable {
    let data: String
}

struct DataDTO<T: Codable>: Codable {
    var data: T
    enum CodingKeys: String, CodingKey {
        case data
    }
}
