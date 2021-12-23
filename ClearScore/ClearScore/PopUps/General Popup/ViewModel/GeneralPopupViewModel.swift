//
//  GeneralPopupViewModel.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/22.
//

import Foundation
import UIKit

class GeneralPopupViewModel : NSObject {
    
    //MARK: call Popup function
    //this function makes the view easy to reuese 
    func Popup(title : String, body : String, currenbtview : UIViewController){
        DispatchQueue.main.async {
            let PopUpViewController = Bundle.main.loadNibNamed("GeneralPopupView", owner: nil, options: nil)?.first as? GeneralPopupViewController
            PopUpViewController?.titleLable.text = title
            PopUpViewController?.bodyText.text = body
            
            PopUpViewController?.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
            currenbtview.view.endEditing(true)
            currenbtview.present(PopUpViewController!, animated:false, completion:nil)
        }
    }
}

