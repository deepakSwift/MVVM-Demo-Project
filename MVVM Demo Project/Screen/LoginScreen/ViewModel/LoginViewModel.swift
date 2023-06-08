//
//  LoginViewModel.swift
//  MVVM Demo Project
//
//  Created by Shiva Kaushik on 27/04/23.
//

import Foundation
import UIKit

public protocol LoginFlowDelegate: AnyObject {
    func actionLoginFailed()
    func actionLoginSuccessful()
}

class LoginViewModel {
    
    var success: Bool?
    public weak var delegate: LoginFlowDelegate?
    //var eventHandler: ((_ event: Event) -> Void)? // Data Binding Closure
    
    
    func logInApi(params: LoginRequest) {
        APIManager.shared.request(modelType: LoginResponse.self, type: APIURLEndPoint.logIn(signInRequest: params)) { result in
            switch result {
            case .success:
                print(result)
                self.delegate?.actionLoginSuccessful()
//                self.delegate?.actionLoginSuccessful()
//                self.success = true
//                self.eventHandler?(.signInRequest(requestSignIn: params))
            case .failure(let error):
                print(error)
                self.delegate?.actionLoginFailed()
//                self.success = false
//                self.eventHandler?(.error(error))
            }
        }
    }
    
    
}

extension LoginViewModel {

    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
        case signInRequest(requestSignIn: LoginRequest)
    }

}
