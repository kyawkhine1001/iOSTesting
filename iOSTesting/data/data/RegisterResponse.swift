//
//  RegisterResponse.swift
//  iOSTesting
//
//  Created by Kyaw Kyaw Khing on 15/07/2021.
//

import Foundation

// MARK: - RegisterRequest
struct RegisterRequest: Codable {
    let fullName, phone, occupationID, city: String
    let partnerCode, deviceID, firebaseToken: String

    enum CodingKeys: String, CodingKey {
        case fullName, phone
        case occupationID = "occupationId"
        case city, partnerCode
        case deviceID = "deviceId"
        case firebaseToken
    }
    init(fullName: String, phone: String, occupationID: String, city: String,partnerCode: String, deviceID: String, firebaseToken: String) {
        self.fullName = fullName
        self.phone = phone
        self.occupationID = occupationID
        self.city = city
        self.partnerCode = partnerCode
        self.deviceID = deviceID
        self.firebaseToken = firebaseToken
    }
}

// MARK: - RegisterResponse
struct RegisterResponse: Codable {
    let timestamp: String
    let responseCode: Int
    let responseDescription: String
    let lifetime: Int?
    let data: UserData?
    let errors:Errors?
}

// MARK: - DataClass
struct UserData: Codable {
//    let id: Int
    let fullName, phone: String
//    let email, dob, gender: String?
//    let weight, height, bmi, totalStepCount: Int
//    let totalEarnPoints: Int
//    let memberTierLevel, userType: String
//    let status, version: Int
//    let profileImg, weightUnit, heightUnit: String?
//    let registerDate: String
//    let memberID, lastSyncDate: String?
//    let firstTime, rememberMe, needSetupInfo, connectedWithFb: Bool

    enum CodingKeys: String, CodingKey {
        case fullName, phone
//             , email, dob, gender, weight, height, bmi, totalStepCount, totalEarnPoints, memberTierLevel, userType, status, version, profileImg, weightUnit, heightUnit, registerDate
//        case memberID = "memberId"
//        case lastSyncDate, firstTime, rememberMe, needSetupInfo, connectedWithFb
    }
}

// MARK: - Errors
struct Errors: Codable {
    let message,fullName, phone: String?
}
