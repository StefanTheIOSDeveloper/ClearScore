//
//  UserData.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/22.
//

import Foundation

struct UserCreditScoreData: Codable {
    let accountIDVStatus, dashboardStatus, personaType: String?
    let creditReportInfo : CreditReportInfo?
}

struct CreditReportInfo: Codable{
    let score, maxScoreValue, currentLongTermDebt, currentShortTermDebt, changeInLongTermDebt, changeInShortTermDebt, daysUntilNextReport ,currentShortTermCreditLimit : Int
    let equifaxScoreBandDescription : String
}
