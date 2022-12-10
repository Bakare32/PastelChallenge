//
//  ApiHelper.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import Foundation

import Alamofire

protocol ApiHelper {
    
}

extension ApiHelper {
    
    func setHeader(auth: String) -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "x-api-key": auth,
            "Accept": "application/json",
        ]
        return headers
    }
    

    
}
