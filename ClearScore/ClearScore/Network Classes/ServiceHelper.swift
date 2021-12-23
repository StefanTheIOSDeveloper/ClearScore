//
//  ServiceHelper.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/22.
//

import Foundation
import UIKit

var setApiHeaders = [ApiHeaders?]()

// easy to set type
enum HttpMethod: String {
    case GET     = "GET"
    case POST    = "POST"
    case DELETE  = "DELETE"
    case PATCH   = "PATCH"
}

struct Resource<T:Codable> {
    let url: URL
    var httpVerb: HttpMethod = .GET
    var body: Data? = nil
}

struct ApiHeaders: Codable {
    let headerValue : String
    let headerKey : String
}

class ServiceHelper {
    
    //This function is created to be reuse for any API call through out the application using generics
    func load<T>(resource: Resource<T>, completion: @escaping(T?, NetworkError? , HTTPURLResponse?) -> Void){
        if NetworkTask().isConnectedToNetwork() {
            var request         = URLRequest(url: resource.url)
            request.httpMethod  = resource.httpVerb.rawValue
            request.httpBody    = resource.body
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            for value in setApiHeaders{
                request.addValue(value?.headerValue ?? "", forHTTPHeaderField: value?.headerKey ?? "")
            }

            setApiHeaders.removeAll()
            
            URLSession.shared.dataTask(with: request){ data, response, error in
                print(String(decoding: data!, as: UTF8.self))
                guard let data = data, error == nil else{
                    completion(nil,.domainError,response as? HTTPURLResponse)
                    return
                }
                
                let results = try? JSONDecoder().decode(T.self, from: data)
                if let results = results {
                    completion(results, nil,response as? HTTPURLResponse)
                    return
                }
                
                //print("⛔️ Header Response : \(response))")
                completion(nil,.decodingError,response as? HTTPURLResponse)
                
            }.resume()
        }else{
            completion(nil,.networkError,nil)
        }
    }
}

