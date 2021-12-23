//
//  MoreInfoViewModel.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/23.
//

import UIKit

class MoreInfoViewModel: NSObject {
    
    let delegate : MoreInfoViewController
    
    init(moreInfoView : MoreInfoViewController) {
       self.delegate = moreInfoView
   }
    
    //MARK: Set Delegates
    func setDelegates(){
        // set long term debt total
        delegate.longTermDebtTotalLabel.text = formatAmount(amount: GlobalData.shareData.userCreditScoreData?.creditReportInfo?.currentLongTermDebt ?? 0)
        
        // set long term debt changes
        delegate.longTermDebtChangeLabel.attributedText = attributedStringFormatter(attributedString: "\(checkValueIncreseDecreaseStatus(amountToCheck: GlobalData.shareData.userCreditScoreData?.creditReportInfo?.changeInLongTermDebt ?? 0)) \(formatAmount(amount: GlobalData.shareData.userCreditScoreData?.creditReportInfo?.changeInLongTermDebt ?? 0)) since last month", textToFormat: formatAmount(amount: GlobalData.shareData.userCreditScoreData?.creditReportInfo?.changeInLongTermDebt ?? 0))
        
        // set short term debt total
        delegate.shortTermDebtTotalLabel.text = formatAmount(amount: GlobalData.shareData.userCreditScoreData?.creditReportInfo?.currentShortTermDebt ?? 0)
        

        // set short term debt changes
        delegate.shortTermDebtChangeLabel.attributedText = attributedStringFormatter(attributedString: "\(checkValueIncreseDecreaseStatus(amountToCheck: GlobalData.shareData.userCreditScoreData?.creditReportInfo?.changeInShortTermDebt ?? 0)) \(formatAmount(amount: GlobalData.shareData.userCreditScoreData?.creditReportInfo?.changeInShortTermDebt ?? 0)) since last month", textToFormat: formatAmount(amount: GlobalData.shareData.userCreditScoreData?.creditReportInfo?.changeInShortTermDebt ?? 0))
        
        // set short term debt limit
        delegate.shortTermDebtLimitLabel.attributedText = attributedStringFormatter(attributedString: "Total credit limit:\(formatAmount(amount: GlobalData.shareData.userCreditScoreData?.creditReportInfo?.currentShortTermCreditLimit ?? 0))", textToFormat: formatAmount(amount: GlobalData.shareData.userCreditScoreData?.creditReportInfo?.currentShortTermCreditLimit ?? 0))
        
        // set amount of days until next report update
        delegate.daysUntilReportLabel.attributedText = attributedStringFormatter(attributedString: "Next report in \( GlobalData.shareData.userCreditScoreData?.creditReportInfo?.daysUntilNextReport ?? 0) days", textToFormat: "\( GlobalData.shareData.userCreditScoreData?.creditReportInfo?.daysUntilNextReport ?? 0) days")
    }
    
    //MARK: Check Value Increse/Decrease Status
    func checkValueIncreseDecreaseStatus(amountToCheck : Int) -> String{
        if amountToCheck > 0{
            return "Up"
        }else{
            return "Down"
        }
        
    }
    
    //MARK: format Amount
    func formatAmount(amount : Int)-> String{
        let formatAmount = amount.formatnumber().replacingOccurrences(of: "-", with: "")
        
        return "R \(formatAmount)"
    }
    
    //MARK: Attributed String Formatter
    func attributedStringFormatter(attributedString : String, textToFormat: String) -> NSMutableAttributedString{
        let attributeString = NSMutableAttributedString.init(string: attributedString)
        let nsRange = NSString(string: attributeString.string).range(of: textToFormat, options: String.CompareOptions.caseInsensitive)
        attributeString.addAttributes([NSAttributedString.Key.font: UIFont.init(name: "Helvetica Neue Medium", size: 18.0) as Any], range: nsRange)
        
        return attributeString
        
    }
    
}
