//
//  HomeServiceConfiguration.swift
//  MangaSocial
//

import Foundation
import Alamofire

enum HomeServiceConfiguration {
    case getHome
}

extension HomeServiceConfiguration: Configuration {
    
    var baseURL: String {
        switch self {
        case .getHome:
            return Constant.Server.demoApiURL
        }
    }
    
    var path: String {
        switch self {
        case .getHome:
            return "main/json.geojson"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getHome:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getHome:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getHome:
            return nil
        }
    }
    
    var data: Data? {
        switch self {
        case .getHome:
            return nil
        }
    }
}
