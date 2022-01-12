//
//  ServiceHelperTest.swift
//  ClearScoreTests
//
//  Created by Stefan on 2022/01/12.
//

import XCTest
@testable import ClearScore

struct emptyTestModel: Codable {
    
}

class ServiceHelperTest: XCTestCase {

    func testServiceHelperGoodPath() throws {
        let resource = Resource<emptyTestModel>(url: URL(string: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values")! , httpVerb: HttpMethod.GET)
        ServiceHelper().load(resource: resource)  { userCreditScoreData, networkError, response  in
            if userCreditScoreData != nil{
                XCTAssertNotNil(userCreditScoreData)
            }else if networkError != nil{
                XCTAssertNotNil(networkError)
            }
            XCTFail()
        }
    }
    
    func testServiceHelperBadPath() throws {
        let resource = Resource<emptyTestModel>(url: URL(string: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.c")! , httpVerb: HttpMethod.GET)
        ServiceHelper().load(resource: resource)  { userCreditScoreData, networkError, response  in
            if userCreditScoreData != nil{
                XCTAssertNotNil(userCreditScoreData)
            }else if networkError != nil{
                XCTAssertNotNil(networkError)
            }
            XCTFail()
        }
    }

}
