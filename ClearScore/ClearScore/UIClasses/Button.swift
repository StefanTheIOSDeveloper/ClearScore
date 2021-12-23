//
//  Button.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/17.
//

import Foundation
import UIKit

@IBDesignable
public class Button: UIButton {
    
    
    
    @IBInspectable public var borderColor:UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable public var borderWidth:CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable public var cornerRadius:CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    private static var _addShadow:Bool = false
    
    @IBInspectable var addShadow:Bool {
        get {
            return Button._addShadow
        }
        set(newValue) {
            if(newValue == true){
                layer.masksToBounds = false
                layer.shadowColor = UIColor.gray.cgColor
                layer.shadowOpacity = 1.0
                layer.shadowOffset = CGSize(width: 0, height: 0)
                layer.shadowRadius = 5
                
                layer.shadowPath = UIBezierPath(rect: bounds).cgPath
                layer.shouldRasterize = true
                layer.rasterizationScale = newValue ? UIScreen.main.scale : 1
            }
        }
    }
    
    @IBInspectable var adjustFontSizeToWidth: Bool {
        get {
            return titleLabel!.adjustsFontSizeToFitWidth
        }
        set {
            titleLabel!.adjustsFontSizeToFitWidth = newValue
            titleLabel!.lineBreakMode             = .byClipping
        }
    }
}
