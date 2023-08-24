//
//  UserData.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/22.
//

import Foundation

struct UserCreditScoreData: Codable {
    let accountIDVStatus : String?
    let dashboardStatus : String?
    let personaType: String?
    let creditReportInfo : CreditReportInfo?
}

struct CreditReportInfo: Codable{
    let score : Int
    let maxScoreValue : Int
    let currentLongTermDebt : Int
    let currentShortTermDebt : Int
    let changeInLongTermDebt : Int
    let changeInShortTermDebt : Int
    let daysUntilNextReport : Int
    let currentShortTermCreditLimit : Int
    let equifaxScoreBandDescription : String
}
