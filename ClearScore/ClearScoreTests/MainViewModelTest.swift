//
//  MainViewModelTest.swift
//  ClearScoreTests
//
//  Created by Stefan on 2022/01/12.
//

import XCTest
@testable import ClearScore

class MainViewModelTest: XCTestCase {

    
    func testProgressBarCalculation() throws {
        let mainView = MainViewController()
        XCTAssertLessThan(mainView.viewModel.calculateUserCreditScorePersentage(score: 500, maxScore: 700),1)
        XCTAssertGreaterThan(mainView.viewModel.calculateUserCreditScorePersentage(score: 500, maxScore: 700),0)
        
    }


}
