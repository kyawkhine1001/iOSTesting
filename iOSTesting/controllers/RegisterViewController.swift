//
//  RegisterViewController.swift
//  iOSTesting
//
//  Created by Kyaw Kyaw Khing on 15/07/2021.
//

import UIKit

class RegisterViewController: BaseUIViewController {

    @IBOutlet weak var tfFullName: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    private let authViewModel:AuthViewModel = Injection().injectAuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickRegisterButton(_ sender: Any) {
        let fullName = tfFullName.text ?? ""
        let phoneNumber = tfPhoneNumber.text ?? ""
        let password = tfPassword.text ?? ""
        
        if fullName.isEmpty{
            Utils.showAlert(viewcontroller: self, title: "Error", message: "Fullname is empty!")
        }else  if phoneNumber.isEmpty{
            Utils.showAlert(viewcontroller: self, title: "Error", message: "PhoneNumber is empty!")
        }else  if password.isEmpty{
            Utils.showAlert(viewcontroller: self, title: "Error", message: "Password is empty!")
        }else {
            self.showLoadingView(showLoading: true)
            let registerRequest = RegisterRequest(fullName: fullName, phone: phoneNumber, occupationID: "5", city: "", partnerCode: "", deviceID: "", firebaseToken: "")
            authViewModel.registerAccount(registerRequest: registerRequest) { userDataResponse in
                self.showLoadingView(showLoading: false)
                print(userDataResponse)
//                Utils.showAlert(viewcontroller: self, title: "Registration", message: "Successfully Register")
                let homeVC:HomeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeViewController")
                homeVC.userData = userDataResponse
                homeVC.modalPresentationStyle = .fullScreen
                self.present(homeVC, animated: true, completion: nil)
            } failure: { error in
                self.showLoadingView(showLoading: false)
                print(error)
                Utils.showAlert(viewcontroller: self, title: "Registration Failed", message: error)
            }

        }
    }
}
