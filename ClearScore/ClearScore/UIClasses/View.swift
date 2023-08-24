//
//  View.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/22.
//

import Foundation
import UIKit

@IBDesignable
public class view: UIView {
    
    //MARK: to Add Shadow
    private static var _addShadow:Bool = false
    
    //MARK: Add Shadow Properties
    @IBInspectable var addShadow:Bool {
        get {
            return view._addShadow
        }
        set(newValue) {
            if(newValue == true){
                layer.masksToBounds = false
                layer.shadowColor = UIColor.black.cgColor
                layer.shadowOpacity = 0.3
                layer.shadowOffset = CGSize(width: 1, height: 0)
                layer.shadowRadius = 3
                
                layer.shadowPath = UIBezierPath(rect: bounds).cgPath
                layer.shouldRasterize = true
                layer.rasterizationScale = newValue ? UIScreen.main.scale : 1
            }
        }
    }
    
    //MARK: Border Color
    @IBInspectable public var borderColor:UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    //MARK: Border Width
    @IBInspectable public var borderWidth:CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    //MARK: Corner Radius
    @IBInspectable public var cornerRadius:CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    
}
