//
//  BaseModel.swift
//  iOSTesting
//
//  Created by Kyaw Kyaw Khing on 15/07/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class BaseModel {
    
    func performRequest(endPoint:String,rawData:[String:String],completion:@escaping (Result<Any,AFError>)->Void) -> DataRequest {

        let urlString = Constants.base_url + endPoint

        let url = URL(string: urlString)
        var request        = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")
        request.timeoutInterval = 180
        do {
            request.httpBody = try JSON(rawData).rawData()
        } catch let error {
            print("Error : \(error.localizedDescription)")
        }
        print("Request data :::::::::::\(request)\(rawData)")

        return AF.request(request).responseJSON{ (response) in
            completion(response.result)
        }
    }

    func performRequest(endPoint:String,rawData:Data,completion:@escaping (Result<Any,AFError>)->Void) -> DataRequest {

        let urlString = Constants.base_url + endPoint
        let url = URL(string: urlString)
        var request        = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")
        request.httpBody = rawData
        request.timeoutInterval = 180
        print("Request data :::::::::::\(request)\(rawData)")
        
        return AF.request(request).responseJSON{ (response) in
            completion(response.result)
        }
    }
    
    
    func performRequestData(endPoint:String,rawData:[String:String],completion:@escaping (Result<Data,AFError>)->Void) -> DataRequest {
        
        let urlString = Constants.base_url + endPoint
        let url = URL(string: urlString)
        var request        = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")
        request.timeoutInterval = 180
        do {
            request.httpBody = try JSON(rawData).rawData()
            
        } catch let error {
            print("Error : \(error.localizedDescription)")
        }
        print("Request params :::::::::::\(rawData)")
        print("Request data :::::::::::\(request)")
        
        
        return AF.request(request).responseData { (response) in
            completion(response.result)
        
        }
    }
    
}

