//
//  AuthViewModelTest.swift
//  iOSTestingTests
//
//  Created by Kyaw Kyaw Khing on 15/07/2021.
//

import XCTest
@testable import iOSTesting

class AuthViewModelTest:XCTestCase{
    var viewModel:AuthViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = AuthViewModel(authRepository: AuthRepositoryMock())
    }
    override func tearDownWithError() throws {
        viewModel = nil
        try super.tearDownWithError()
    }
    
    func testAlreadyRegisterAccount(){
        let registerRequest = RegisterRequest(fullName: "Kyaw Khine", phone: "09423696548", occupationID: "", city: "", partnerCode: "", deviceID: "", firebaseToken: "")
        var userData:UserData? = nil
        var errorMessage:String? = nil
        let expectedErrorMessage = "This number is already registered with an existing account. Please login with your number or register with a different one."
        
        viewModel.registerAccount(registerRequest: registerRequest) { userDataResponse in
            userData = userDataResponse
        } failure: { error in
            errorMessage = error
        }
        
        XCTAssertNil(userData)
        XCTAssertEqual(errorMessage, expectedErrorMessage)
    }
    
    func testRegisterNewAccount(){
        let fullName = "Kyaw Khine"
        let phoneNumber = "09423696540"
        let registerRequest = RegisterRequest(fullName: fullName, phone: phoneNumber, occupationID: "", city: "", partnerCode: "", deviceID: "", firebaseToken: "")
        let expectedUserData = UserData(fullName: fullName, phone: phoneNumber)
        var userData:UserData? = nil
        var errorMessage:String? = nil
        
        viewModel.registerAccount(registerRequest: registerRequest) { userDataResponse in
            userData = userDataResponse
        } failure: { error in
            errorMessage = error
        }
        
        XCTAssertNil(errorMessage)
        XCTAssertEqual(userData?.phone,expectedUserData.phone,"Expected user's phone number is not matched")
    }
    
}
