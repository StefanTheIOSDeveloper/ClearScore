//
//  UserDataAPI.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/22.
//

import Foundation

class UserCreditScoreDataAPI {

    //MARK: Get User Data
    func getUserCreditScoreData(completion: @escaping (UserCreditScoreData?, NetworkError?) ->()){
        
        //using my service helper function to fetch the data 
        let resource = Resource<UserCreditScoreData>(url: URL(string: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values")! , httpVerb: HttpMethod.GET)
        ServiceHelper().load(resource: resource)  { userCreditScoreData, networkError, response  in
            if userCreditScoreData != nil{
                completion(userCreditScoreData,nil)
            }else if networkError != nil{
                completion(nil,networkError)
            }
        }
    }
}
