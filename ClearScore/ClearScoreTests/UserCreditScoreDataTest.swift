//
//  UserCreditScoreDataTest.swift
//  ClearScoreTests
//
//  Created by Stefan on 2022/01/11.
//

import XCTest
@testable import ClearScore

class UserCreditScoreDataTest: XCTestCase {

    func testCreditScoreDataParse() throws {
        let dumyAPIData = """
            {"accountIDVStatus":"PASS",
            "creditReportInfo":{
                "score":514,
                "scoreBand":4,
                "clientRef":"CS-SED-655426-708782",
                "status":"MATCH",
                "maxScoreValue":700,
                "minScoreValue":0,
                "monthsSinceLastDefaulted":-1,
                "hasEverDefaulted":false,
                "monthsSinceLastDelinquent":1,
                "hasEverBeenDelinquent":true,
                "percentageCreditUsed":44,
                "percentageCreditUsedDirectionFlag":1,
                "changedScore":0,
                "currentShortTermDebt":13758,
                "currentShortTermNonPromotionalDebt":13758,
                "currentShortTermCreditLimit":30600,
                "currentShortTermCreditUtilisation":44,
                "changeInShortTermDebt":549,
                "currentLongTermDebt":24682,
                "currentLongTermNonPromotionalDebt":24682,
                "currentLongTermCreditLimit":null,
                "currentLongTermCreditUtilisation":null,
                "changeInLongTermDebt":-327,
                "numPositiveScoreFactors":9,
                "numNegativeScoreFactors":0,
                "equifaxScoreBand":4,
                "equifaxScoreBandDescription":"Excellent",
                "daysUntilNextReport":9
                },
            "dashboardStatus":"PASS",
            "personaType":"INEXPERIENCED",
            "coachingSummary":{
                "activeTodo":false,
                "activeChat":true,
                "numberOfTodoItems":0,
                "numberOfCompletedTodoItems":0,
                "selected":true
                },
            "augmentedCreditScore":null
            }
            """
        
        let jsonData = dumyAPIData.data(using: .utf8)!
        let userCreditScoreData = try! JSONDecoder().decode(UserCreditScoreData.self, from: jsonData)
        
        XCTAssertNotNil(userCreditScoreData.creditReportInfo)
        XCTAssertEqual(514, userCreditScoreData.creditReportInfo?.score)
        XCTAssertEqual(700, userCreditScoreData.creditReportInfo?.maxScoreValue)
        XCTAssertEqual(24682, userCreditScoreData.creditReportInfo?.currentLongTermDebt)
        XCTAssertEqual(13758, userCreditScoreData.creditReportInfo?.currentShortTermDebt)
        XCTAssertEqual(-327, userCreditScoreData.creditReportInfo?.changeInLongTermDebt)
        XCTAssertEqual(549, userCreditScoreData.creditReportInfo?.changeInShortTermDebt)
        XCTAssertEqual(9, userCreditScoreData.creditReportInfo?.daysUntilNextReport)
        XCTAssertEqual(30600, userCreditScoreData.creditReportInfo?.currentShortTermCreditLimit)
        XCTAssertEqual("Excellent", userCreditScoreData.creditReportInfo?.equifaxScoreBandDescription)
        XCTAssertEqual("PASS", userCreditScoreData.accountIDVStatus)
        XCTAssertEqual("PASS", userCreditScoreData.dashboardStatus)
        XCTAssertEqual("INEXPERIENCED", userCreditScoreData.personaType)
    }

}
