//
//  GlobalData.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/22.
//

import Foundation

class GlobalData {
    //singalton class to add properties that will be accessed through out the application
    
    
    public static let shareData = GlobalData()
    
    //MARK: Set User Credit Score Data Instance
    public var userCreditScoreData : UserCreditScoreData? = nil

    //MARK: Set General Popup Instance
    public let generalPopup = GeneralPopupViewModel()
    
}
