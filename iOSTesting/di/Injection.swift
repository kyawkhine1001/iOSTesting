//
//  Injection.swift
//  iOSTesting
//
//  Created by Kyaw Kyaw Khing on 15/07/2021.
//

import Foundation
final class Injection{
    
    func injectAuthViewModel()->AuthViewModel{
        return AuthViewModel(authRepository: injectAuthRepository())
    }
    
    func injectAuthRepository()->AuthRepository{
        return AuthRepositoryImpl()
    }
}
