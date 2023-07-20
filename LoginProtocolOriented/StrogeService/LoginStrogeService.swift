//
//  LoginStrogeService.swift
//  LoginProtocolOriented
//
//  Created by eyüp yaşar demir on 19.07.2023.
//

import Foundation

protocol LoginStrogeService{
    var userAccessToken : String {get}
    func setUserAccessToken(token: String)
    func getUserAccessToken() -> String?
}
