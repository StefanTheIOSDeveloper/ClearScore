//
//  NetworkError.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/22.
//

import Foundation

//this was created as an easy access point for all errors and discriptions that the application might experiance

//MARK: Network errors
enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
    case networkError
    case InvalidUserNameOrPassword
    
    func displayErrorCode() -> String {
        switch self {
        case .decodingError:
            return NSLocalizedString("decodeingError", comment: "DecodingError")
        case .domainError:
            return NSLocalizedString("domainError", comment: "DomainError")
        case .urlError:
            return NSLocalizedString("urlError", comment: "UrlError")
        case .networkError:
            return NSLocalizedString("networkError", comment: "NetworkError")
        default:
            return NSLocalizedString("noErrorDiscription", comment: "NoErrorDiscription")
        }
    }
}
