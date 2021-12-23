//
//  GeneralPopupViewController.swift
//  ClearScore
//
//  Created by Stefan on 2021/12/22.
//

import UIKit

class GeneralPopupViewController: UIViewController {
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var bodyText: UITextView!
    @IBOutlet weak var okButton: Button!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: OK Button Click
    @IBAction func okButtonClick(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
}
