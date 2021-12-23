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
            return NSLocalizedString(UserFriendlyNetworkErrors.decodeingError.rawValue, comment: "DecodingError")
        case .domainError:
            return NSLocalizedString(UserFriendlyNetworkErrors.domainError.rawValue, comment: "DomainError")
        case .urlError:
            return NSLocalizedString(UserFriendlyNetworkErrors.urlError.rawValue, comment: "UrlError")
        case .networkError:
            return NSLocalizedString(UserFriendlyNetworkErrors.networkError.rawValue, comment: "NetworkError")
        default:
            return "Need to create error discription"
        }
    }
}

enum UserFriendlyNetworkErrors: String {
    case errorTitle = "Error"
    case decodeingError = "We having trouble reading the app data."
    case domainError    = "Problem retriving app data."
    case urlError       = "Issue connecting to our servers."
    case networkError   = "No network connection."
    
}
