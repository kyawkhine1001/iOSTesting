//
//  AuthRepositoryMock.swift
//  iOSTestingTests
//
//  Created by Kyaw Kyaw Khing on 15/07/2021.
//

import Foundation
@testable import iOSTesting

class AuthRepositoryMock: AuthRepository{
    func makeRegistration(registerRequest: RegisterRequest, success: @escaping (RegisterResponse) -> Void, failure: @escaping (String) -> Void) {
        if registerRequest.phone == "09423696548" {
            success(RegisterResponse(timestamp: "", responseCode: 200, responseDescription: "Successfully Created New Account!", lifetime: nil, data: nil, errors: Errors(message: nil, fullName: nil, phone: "This number is already registered with an existing account. Please login with your number or register with a different one.")))
        }else{
            success(RegisterResponse(timestamp: "", responseCode: 200, responseDescription: "Successfully Created New Account!", lifetime: nil, data: UserData(fullName: registerRequest.fullName, phone: registerRequest.phone), errors: nil))
        }
    }
    
    
}
