//
//  BaseUIViewController.swift
//  iOSTesting
//
//  Created by Kyaw Kyaw Khing on 15/07/2021.
//

import Foundation
import UIKit

class BaseUIViewController: UIViewController,UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Keyboard Show Hide Observer
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //Hide Keyboard when click view
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(didTapView))
        tapRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapRecognizer)
        
        // Network connection Observer
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(statusManager),
                                               name: .flagsChanged,
                                               object: nil)
    }
    
    @objc func statusManager(_ notification: Notification) {
        updateUserInterface()
    }
    
    func updateUserInterface() {
        if !Network.reachability.isReachable {
            
            //view.backgroundColor = .red
            Utils.showAlert(viewcontroller: self, title: "Network Connection", message:"Network Connection does not exist. Please check internet connection.")
            
        }
    }

    //Remove Observer
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("FlagsChanged"), object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
        
        //        print("Remove observer.")
    }
}

//Keyboard Show Hide Functions
extension BaseUIViewController{
    @objc func keyboardWillChange(notification : Notification) {
    }
    
    @objc func didTapView() {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
