//
//  ClearScoreUITestsLaunchTests.swift
//  ClearScoreUITests
//
//  Created by Stefan on 2021/12/17.
//

import XCTest

class ClearScoreUITestsLaunchTests: XCTestCase {
    
    var app: XCUIApplication!

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testViewVisibility() throws {
            let yourView = app.otherElements["PopupView"] // Replace with your identifier
            
            XCTAssertTrue(yourView.waitForExistence(timeout: 5)) // Wait for view to appear

            // Check if the view is visible and hittable
            XCTAssertTrue(yourView.isHittable)
        }

    func testOKButtonTapOnGeneralPopup() throws {
        let okButton = app.buttons["GeneralPopupOKButton"]
        XCTAssert(okButton.exists)
        
        okButton.tap()
        
    }
    
}
