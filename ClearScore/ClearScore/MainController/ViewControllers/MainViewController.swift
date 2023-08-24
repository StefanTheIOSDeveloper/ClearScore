//
//  ViewController.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/17.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var creditScoreView: UIVisualEffectView!
    @IBOutlet var userScoreLabel: UILabel!
    @IBOutlet var scoreOutOfLabel: UILabel!
    @IBOutlet var scoreBandDescriptionLabel: UILabel!
    
    lazy var viewModel = MainViewModel(mainView: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.setView()
    }
    
}

