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
        viewModel.setDelegates()
    }
    
    //MARK: Credit Score View Tap Gesture Event
    @objc func creditScoreViewTap(){
        //Opening my More Info View
        let PopUpViewController = UIStoryboard(name: "MoreInfoView", bundle: nil).instantiateViewController(withIdentifier: "MoreInfoView") as! MoreInfoViewController
        self.present(PopUpViewController, animated:true, completion:nil)
    }

    //MARK: Profile Button Click Event
    @IBAction func profileButtonClick(_ sender: Any) {
        //Just displaying error message as this feuture doesnt exist
        GlobalData.shareData.generalPopup.Popup(title: "Error", body: "This Feature is stil under development", currenbtview: self)
    }
    
}

