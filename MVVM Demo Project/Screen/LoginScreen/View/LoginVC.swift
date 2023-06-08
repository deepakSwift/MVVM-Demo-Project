//
//  LoginVC.swift
//  MVVM Demo Project
//
//  Created by Shiva Kaushik on 27/04/23.
//

import UIKit

open class LoginVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var numberTYF: UITextField!
    
    // MARK: - Variables
    var viewModel = LoginViewModel()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        // Do any additional setup after loading the view.
    }
//    // MARK: - Navigations
    func navigateToOTPScreen() {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "OTPScreenVC") as! OTPScreenVC
        //viewController.getPhoneNumber = self.txtFldMobileNumber.text!
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        let parameters = LoginRequest(device_type: "ios", phone: numberTYF.text ?? "", device_token: "")
        viewModel.logInApi(params: parameters)
    }
}

extension LoginVC: LoginFlowDelegate {
    public func actionLoginFailed() {
        print("ERROR AAGYA")
    }
    
    public func actionLoginSuccessful() {
        DispatchQueue.main.async {
            self.navigateToOTPScreen()
        }
        
    }
    
    
}
