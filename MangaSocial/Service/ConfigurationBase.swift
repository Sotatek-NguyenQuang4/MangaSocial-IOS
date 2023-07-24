//
//  ConfigurationBase.swift
//  MangaSocial
//

import Foundation

enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}

struct ServiceError: Error {
    let issueCode: IssueCode
    var message: String {
        return issueCode.message
    }
    static var urlError: ServiceError {
        return ServiceError(issueCode: IssueCode.CUSTOMMES(message: "URL is wrong"))
    }
    static var notFoundData: ServiceError {
        return ServiceError(issueCode: IssueCode.CUSTOMMES(message: "Not found Data"))
    }
    static var parseError: ServiceError {
        return ServiceError(issueCode: IssueCode.CUSTOMMES(message: "Parse Model Error"))
    }
    static var jsonError: ServiceError {
        return ServiceError(issueCode: IssueCode.CUSTOMMES(message: "Response is not JSON"))
    }
    static var somethinkWrong: ServiceError {
        return ServiceError(issueCode: IssueCode.CUSTOMMES(message: "Something went wrong"))
    }
}

enum IssueCode {
    case CUSTOMMES(message: String)
    static func initValue(value: String) -> IssueCode {
        if value.isEmpty {
            return .CUSTOMMES(message: "Something went wrong")
        }
        return .CUSTOMMES(message: value)
    }
    var message: String {
        switch self {
        case .CUSTOMMES(let message):
            return message
        }
    }
}

extension IssueCode {
    private static func issueCode(fromCode code: String) -> IssueCode {
        return initValue(value: code.uppercased())
    }
}
