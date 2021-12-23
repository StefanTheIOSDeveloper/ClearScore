//
//  IntegerExtentions.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/23.
//

import Foundation

extension Int {
    func formatnumber() -> String {
        let formater = NumberFormatter()
        formater.groupingSeparator = ","
        formater.numberStyle = .decimal
        return formater.string(from: NSNumber(value: self))!
    }
}
