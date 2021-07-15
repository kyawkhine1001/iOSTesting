//
//  AuthRepository.swift
//  iOSTesting
//
//  Created by Kyaw Kyaw Khing on 15/07/2021.
//

import Foundation

protocol AuthRepository {
    func makeRegistration(registerRequest:RegisterRequest, success: @escaping (RegisterResponse) -> Void,failure: @escaping (String) -> Void)
}
