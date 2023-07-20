//
//  RootViewModel.swift
//  LoginProtocolOriented
//
//  Created by eyüp yaşar demir on 19.07.2023.
//

import Foundation

class RootViewModel{
    
    private let loginStrogeService: LoginStrogeService
    
    weak var output: RootViewModelOutput?
    
    init(loginStrogeService: LoginStrogeService, output: RootViewModelOutput? = nil) {
        self.loginStrogeService = loginStrogeService
      
    }
    
    func checkLogin() {
        if let accessToken = loginStrogeService.getUserAccessToken(), !accessToken.isEmpty{
            //showMainApp()
            output?.showMainApp()
        }else{
            //showLoginApp()
            output?.showLogin()
        }
    }

    
}
