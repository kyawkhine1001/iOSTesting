//
//  AuthModel.swift
//  iOSTesting
//
//  Created by Kyaw Kyaw Khing on 15/07/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthRepositoryImpl:BaseModel,AuthRepository {
    
    func makeRegistration(registerRequest:RegisterRequest, success: @escaping (RegisterResponse) -> Void,failure: @escaping (String) -> Void){
        let rawData = [
            "fullName": registerRequest.fullName,
            "phone": registerRequest.phone,
            "occupationId": registerRequest.occupationID,
            "city": registerRequest.city,
            "partnerCode": registerRequest.partnerCode,
            "deviceId": registerRequest.deviceID,
            "firebaseToken": registerRequest.firebaseToken,
        ]
        
        let _ = super.performRequestData(endPoint: ApiServiceEndPoint.registerAccount, rawData: rawData, completion: { result in
            switch result{
            case .success(let result):
                do {
                    let decoder = JSONDecoder()
                    let registerResponse = try decoder.decode(RegisterResponse.self, from: result)
                    success(registerResponse)
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                //print("Login error", error.localizedDescription)
                failure("")
            }
            
        })
    
    }
    
    
}
