//
//  SignUpViewMode.swift
//  FirebaseDemo
//
//  Created by Deepu mishra on 02/04/26.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class SignUpViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
 
}

extension SignUpViewModel {
    
    func userSignUpApiCall() async throws {
      
        let result =  try await AuthenticationManager.shared.createUser(
            email: email,
            password: password
        )        
        print("Sign up Result \(result)")
    }
}


extension SignUpViewModel {
    
    private func inputValidation() -> Bool {
        
        return true
        
    } 
}
