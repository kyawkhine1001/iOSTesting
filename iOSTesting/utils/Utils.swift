//
//  Utils.swift
//  iOSTesting
//
//  Created by Kyaw Kyaw Khing on 15/07/2021.
//

import Foundation
import UIKit

class Utils{
    static func showAlert(viewcontroller:UIViewController,title:String,message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        viewcontroller.present(alert, animated: true, completion: nil)
    }
    
}
