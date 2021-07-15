//
//  AuthViewModel.swift
//  iOSTesting
//
//  Created by Kyaw Kyaw Khing on 15/07/2021.
//

import Foundation

class AuthViewModel{
    private var authRepository:AuthRepository
    
    init(authRepository:AuthRepository) {
        self.authRepository = authRepository
    }
    
    func registerAccount(registerRequest:RegisterRequest, success: @escaping (UserData) -> Void,failure: @escaping (String) -> Void){
        authRepository.makeRegistration(registerRequest: registerRequest, success: { (result) in
            if result.responseCode == 200 {
                if let data = result.data{
                    success(data)
                }else if let errors = result.errors{
                    if let nameError = errors.fullName{
                        failure(nameError)
                    }else if let phoneError = errors.phone{
                        failure(phoneError)
                    }else if let message = errors.message{
                        failure(message)
                    }
                }
            } else {
                failure(result.responseDescription)
            }
        }) { (error) in
            failure(error)
        }
    }
    
}
