//
//  StartScreenViewController.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/22.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    lazy var viewModel = StartScreenViewModel(startScreenView: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getUserCreditScoreData()
    }

}
