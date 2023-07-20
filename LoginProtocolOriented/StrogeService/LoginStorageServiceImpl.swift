//
//  LoginStorageServiceImpl.swift
//  LoginProtocolOriented
//
//  Created by eyüp yaşar demir on 19.07.2023.
//

import Foundation

class LoginStorageServiceImpl : LoginStrogeService {
    
    private let storage = UserDefaults.standard
    
    var userAccessToken: String{
        return "ACCESS_TOKEN"
    }
    
    func setUserAccessToken(token: String) {
        storage.set(token, forKey: userAccessToken)
    }
    
    func getUserAccessToken() -> String? {
        return storage.string(forKey: userAccessToken)
    }
    
 
}
