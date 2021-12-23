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
    private static var _addShadow:Bool = false
    
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
    
    private static var _addCellShadow:Bool = false
    
    @IBInspectable var _addCellShadow:Bool {
        get {
            return view._addShadow
        }
        set(newValue) {
            if(newValue == true){
                layer.masksToBounds = false
                layer.shadowColor = UIColor.black.cgColor
                layer.shadowOpacity = 0.2
                layer.shadowRadius = 3
                layer.shadowOffset = CGSize(width: 0, height: 1)

            }
        }
    }
    
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
    
    
}
