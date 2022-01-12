//
//  PopupViewTest.swift
//  ClearScoreTests
//
//  Created by Stefan on 2022/01/12.
//

import XCTest
@testable import ClearScore

class PopupViewTest: XCTestCase {

    func testPopupNibView() throws {
        XCTAssertNotNil(Bundle.main.loadNibNamed("GeneralPopupView", owner: nil, options: nil)?.first as? GeneralPopupViewController)
    }

}
