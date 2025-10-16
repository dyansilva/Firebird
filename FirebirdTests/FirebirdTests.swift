//
//  FirebirdTests.swift
//  FirebirdTests
//
//  Created by Dyan on 16/10/25.
//

import XCTest
@testable import Firebird

@MainActor
final class FirebirdTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRegister() throws {
        let manager = UserManager(business: UserBuniness())
        
        // Cria 3 expectativas (uma para cada chamada)
        let exp1 = expectation(description: "register - invalid email")
        let exp2 = expectation(description: "register - weak password")
        let exp3 = expectation(description: "register - valid user")
        
        manager.register(email: "ateste@teste.coma", password: "a") { userModel in
            print("✅ Success:", userModel)
            exp1.fulfill()
        } failureHandler: { error in
            print("❌ Error:", error)
            exp1.fulfill()
        }
        
        manager.register(email: "aaaa", password: "123#455s-") { userModel in
            print("✅ Success:", userModel)
            exp2.fulfill()
        } failureHandler: { error in
            print("❌ Error:", error)
            exp2.fulfill()
        }
        
        manager.register(email: "teste@teste.com", password: "123#455s-") { userModel in
            print("✅ Success:", userModel)
            exp3.fulfill()
        } failureHandler: { error in
            print("❌ Error:", error)
            exp3.fulfill()
        }
        
        // Aguarda até 5 segundos para todas as operações finalizarem
        wait(for: [exp1, exp2, exp3], timeout: 30.0)
    }
    
    //    func testLogin() throws {
    //        let manager = UserManager(business: UserBuniness())
    //
    //        manager.login(email: "aa", password: "aa") { userModel in
    //            print(userModel)
    //        } failureHandler: { error in
    //            print(error)
    //        }
    //
    //        manager.login(email: "teste@teste.com", password: "123#455s-") { userModel in
    //            print(userModel)
    //        } failureHandler: { error in
    //            print(error)
    //        }
    //
    //    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
