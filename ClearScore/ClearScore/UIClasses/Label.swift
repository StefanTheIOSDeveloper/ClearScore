//
//  Label.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/17.
//

import Foundation
import UIKit

@IBDesignable
public class Label: UILabel {

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

