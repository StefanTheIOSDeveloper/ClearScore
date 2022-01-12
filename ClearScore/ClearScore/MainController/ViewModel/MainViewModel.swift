//
//  MainViewModel.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/21.
//

import Foundation
import UIKit

class MainViewModel: NSObject {
    let progressBarShapeLayer = CAShapeLayer()
    let delegate : MainViewController
    
    init(mainView : MainViewController) {
       self.delegate = mainView
   }
    
    //MARK: Set Delegates
    func setDelegates(){
        //set user score label
        delegate.userScoreLabel.text = String(GlobalData.shareData.userCreditScoreData?.creditReportInfo?.score ?? 0)
        
        //formatting string for score base line
        let attributeString = NSMutableAttributedString.init(string:"out of \(GlobalData.shareData.userCreditScoreData?.creditReportInfo?.maxScoreValue ?? 0)")
        let nsRange = NSString(string: attributeString.string).range(of: String(GlobalData.shareData.userCreditScoreData?.creditReportInfo?.maxScoreValue ?? 0), options: String.CompareOptions.caseInsensitive)
        attributeString.addAttributes([NSAttributedString.Key.font: UIFont.init(name: "Helvetica Neue Medium", size: 18.0) as Any], range: nsRange)
        //set formated score label
        delegate.scoreOutOfLabel.attributedText = attributeString
        
        //set score banc description label
        delegate.scoreBandDescriptionLabel.text = GlobalData.shareData.userCreditScoreData?.creditReportInfo?.equifaxScoreBandDescription ?? ""
        
        //create circle progress view
        createCircleProgressBar()
    }
    
    
    //MARK:
    func createCircleProgressBar(){
        
        //modify credit score view layer
        delegate.creditScoreView.layer.cornerRadius = delegate.creditScoreView.contentView.frame.size.width/2
        delegate.creditScoreView.layer.borderColor = UIColor.white.cgColor
        delegate.creditScoreView.layer.borderWidth = 1
        delegate.creditScoreView.clipsToBounds = true
        
        //create circle progerss shape layer
        let circlePath = UIBezierPath(arcCenter: .zero, radius: delegate.creditScoreView.layer.cornerRadius-10, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        progressBarShapeLayer.path = circlePath.cgPath
        progressBarShapeLayer.strokeColor = UIColor(named: "Purple")?.cgColor
        progressBarShapeLayer.position = delegate.creditScoreView.contentView.center
        progressBarShapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
        progressBarShapeLayer.fillColor = UIColor.clear.cgColor
        progressBarShapeLayer.lineWidth = 3
        progressBarShapeLayer.strokeEnd = 0
        progressBarShapeLayer.lineCap = .round
        
        //add progress shape layer to my credit score view
        delegate.creditScoreView.contentView.layer.addSublayer(progressBarShapeLayer)
        
        //add tap gesture to credit score view
        delegate.creditScoreView.addGestureRecognizer(UITapGestureRecognizer(target: delegate.self, action: #selector(delegate.creditScoreViewTap)))
        
        //add animation to progress layer
        addProgressAnimation(progressValue: calculateUserCreditScorePersentage(score: Double(GlobalData.shareData.userCreditScoreData?.creditReportInfo?.score ?? 0), maxScore: Double(GlobalData.shareData.userCreditScoreData?.creditReportInfo?.maxScoreValue ?? 0)))
    }
    
    //MARK: add Progress Animation
    func addProgressAnimation(progressValue : Double){
        let progressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        progressAnimation.toValue = progressValue
        progressAnimation.duration = 1
        progressAnimation.fillMode = .forwards
        progressAnimation.isRemovedOnCompletion = false
        progressBarShapeLayer.add(progressAnimation, forKey: "creditScoreIndicator")
    }
    
    
    //MARK: Calculate User Credit Score Persentage
    func calculateUserCreditScorePersentage(score : Double, maxScore : Double) -> Double{
        let circleProgressbarPosition = score/maxScore
        
        return circleProgressbarPosition
    }
}
