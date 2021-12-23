//
//  StartScreenViewModel.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/22.
//

import Foundation
import UIKit

class StartScreenViewModel: NSObject {
    
    let delegate : StartScreenViewController
    
    init(startScreenView : StartScreenViewController) {
       self.delegate = startScreenView
   }
    
    //MARK: Get User Credit Score Data
    func getUserCreditScoreData(){
        // using the api class function to get the user credit score data
        UserCreditScoreDataAPI().getUserCreditScoreData { userCreditScoreData, networkError in
            DispatchQueue.main.async { [self] in
                if userCreditScoreData != nil {
                    // setting the data in my singlton object to make it globaly accessable
                    GlobalData.shareData.userCreditScoreData = userCreditScoreData
                    delegate.performSegue(withIdentifier: "OpenDashboard", sender: nil)
                }else if networkError != nil{
                    // show error popup if there is a problem on fetching the data
                    GlobalData.shareData.generalPopup.Popup(title: "Error", body: networkError?.displayErrorCode() ?? "", currenbtview: delegate.self)
                }
                
            }
        }
    }
    
}

