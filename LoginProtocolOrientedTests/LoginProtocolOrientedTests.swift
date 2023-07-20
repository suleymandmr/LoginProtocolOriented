//
//  LoginProtocolOrientedTests.swift
//  LoginProtocolOrientedTests
//
//  Created by eyüp yaşar demir on 19.07.2023.
//

import XCTest
@testable import LoginProtocolOriented

final class LoginProtocolOrientedTests: XCTestCase {

    private var viewModel: RootViewModel!
    private var loginStorageService: MockLoginStrogeService!
    private var output: MockRootViewModelOutput!
    
    override func setUpWithError() throws {
  
        loginStorageService = MockLoginStrogeService()
        viewModel = RootViewModel(loginStrogeService: loginStorageService)
        output = MockRootViewModelOutput()
        
        viewModel.output = output
    }

    override func tearDownWithError() throws {
        viewModel = nil
        loginStorageService = nil
    }

    func testShowLogin_whenLoginStrogeReturnEmptyAccessToken() throws {
        loginStorageService.stroge = [:]
        viewModel.checkLogin()
        
        XCTAssertEqual(output.checkArray.first, .login )
    }
    func testShowLogin_whenLoginStrogeReturnEmptyString() throws {
        loginStorageService.stroge["ACCESS_TOKEN"] = ""
        viewModel.checkLogin()
        
        XCTAssertEqual(output.checkArray.first, .login )
    }
    
    func testShowMainApp_whenLoginStrogeReturnAccessToken() throws {
        loginStorageService.stroge["ACCESS_TOKEN"] = "12345654derer321234"
        viewModel.checkLogin()
        
        XCTAssertEqual(output.checkArray.first, .mainApp )
    }

    

}

class MockLoginStrogeService : LoginStrogeService{
    var userAccessToken: String{
        return "ACCESS_TOKEN"
    }
    var stroge : [String : String] = [:]
    func setUserAccessToken(token: String) {
        stroge[userAccessToken] = token
    }
    
    func getUserAccessToken() -> String? {
        return stroge[userAccessToken]
    }
}

class MockRootViewModelOutput: RootViewModelOutput{
    
    enum Check{
        case login
        case mainApp
    }
    
    var checkArray : [Check] = []
    
    func showLogin() {
        checkArray.append(.login)
    }
    
    func showMainApp() {
        checkArray.append(.mainApp)
    }
    
    
}
