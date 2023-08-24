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
    
    //MARK: Set View
    func setView(){
        delegate.creditScoreView.alpha = 0
        //set user score label
        delegate.scoreOutOfLabel.text = "\(NSLocalizedString("outOf", comment: "translation")) \(GlobalData.shareData.userCreditScoreData?.creditReportInfo?.maxScoreValue ?? 0)"
        
        //set score banc description label
        delegate.scoreBandDescriptionLabel.text = NSLocalizedString(GlobalData.shareData.userCreditScoreData?.creditReportInfo?.equifaxScoreBandDescription.lowercased() ?? "", comment: "translation") 

        //create circle progress view
        createCircleProgressBar()
    }
    
    
    //MARK: Create Circle ProgressBar
    func createCircleProgressBar(){
        
        //modify credit score view layer
        delegate.creditScoreView.layer.cornerRadius = delegate.creditScoreView.contentView.frame.size.width/2
        delegate.creditScoreView.clipsToBounds = true
        
        //create circle progerss shape layer
        let circlePath = UIBezierPath(arcCenter: .zero, radius: delegate.creditScoreView.layer.cornerRadius-10, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        progressBarShapeLayer.path = circlePath.cgPath
        progressBarShapeLayer.strokeColor = UIColor.white.cgColor
        progressBarShapeLayer.position = delegate.creditScoreView.contentView.center
        progressBarShapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
        progressBarShapeLayer.fillColor = UIColor.clear.cgColor
        progressBarShapeLayer.lineWidth = 3
        progressBarShapeLayer.strokeEnd = 0
        progressBarShapeLayer.lineCap = .round
        
        //add progress shape layer to my credit score view
        delegate.creditScoreView.contentView.layer.addSublayer(progressBarShapeLayer)
        
        //add animation to progress layer
        delegate.creditScoreView.alpha = 0.0
        UIView.animate(withDuration: 1, animations: { [self] in
            delegate.creditScoreView.alpha = 0.8
        }, completion: { [self]_ in
            delegate.userScoreLabel.text = String(GlobalData.shareData.userCreditScoreData?.creditReportInfo?.score ?? 0)
            addProgressAnimation(progressValue: calculateUserCreditScorePersentage(score: Double(GlobalData.shareData.userCreditScoreData?.creditReportInfo?.score ?? 0), maxScore: Double(GlobalData.shareData.userCreditScoreData?.creditReportInfo?.maxScoreValue ?? 0)))
        })
        
    }
    
    //MARK: add Progress Animation
    func addProgressAnimation(progressValue : Double){
        let progressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        progressAnimation.fillMode = .forwards
        progressAnimation.isRemovedOnCompletion = false
        progressAnimation.duration = 1
        
        //easeInOutCubic
        progressAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.645, 0.045, 0.355, 1)
        
        progressAnimation.fromValue = 0
        progressAnimation.toValue = progressValue
        progressBarShapeLayer.add(progressAnimation, forKey: "creditScoreIndicator")
    }
    
    
    //MARK: Calculate User Credit Score Persentage
    func calculateUserCreditScorePersentage(score : Double, maxScore : Double) -> Double{
        let circleProgressbarPosition = score/maxScore
        return circleProgressbarPosition
    }
}
