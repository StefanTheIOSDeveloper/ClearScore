//
//  MoreInfoViewController.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/22.
//

import UIKit

class MoreInfoViewController: UIViewController {
    @IBOutlet var longTermDebtTotalLabel: UILabel!
    @IBOutlet var longTermDebtChangeLabel: UILabel!
    @IBOutlet var shortTermDebtTotalLabel: UILabel!
    @IBOutlet var shortTermDebtLimitLabel: UILabel!
    @IBOutlet var shortTermDebtChangeLabel: UILabel!
    @IBOutlet var daysUntilReportLabel: UILabel!
    
    lazy var viewModel = MoreInfoViewModel(moreInfoView: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setDelegates()
    }
    
    //MARK: Close Button Click Event
    @IBAction func closeButtonClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
