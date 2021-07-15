//
//  HomeViewController.swift
//  iOSTesting
//
//  Created by Kyaw Kyaw Khing on 15/07/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var lblGreeting: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
    var userData:UserData?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userData = userData {
            self.lblGreeting.text = "Hi , "+userData.fullName
            self.lblPhone.text = "We will call to your number : 09"+userData.phone
        }
    }
}
