//
//  LoginViewModel.swift
//  FirebaseDemo
//
//  Created by Deepu mishra on 02/04/26.
//

import Foundation
import Combine


@MainActor
class LoginViewModel: ObservableObject {
    
    @Published  var email: String = ""
    @Published  var password: String = ""
    @Published  var emailError: String = ""
    @Published  var passwordError: String = ""
    @Published  var isFormValid: Bool = false
    
}


extension LoginViewModel {
    
    func validateEmail() {
        if email.isEmpty {
            emailError = "Email is required"
        } else if !isValidEmail(email) {
            emailError = "Invalid email format"
        } else {
            emailError = ""
        }
    }
    
    func validatePassword() {
        if password.isEmpty {
            passwordError = "Password is required"
        } else if password.count < 6 {
            passwordError = "Password must be at least 6 characters"
        } else {
            passwordError = ""
        }
    }
    
    func validateForm() {
        isFormValid = emailError.isEmpty &&
                      passwordError.isEmpty &&
                      !email.isEmpty &&
                      !password.isEmpty
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx =
        "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: email)
    }
    
}


extension LoginViewModel {
    
    func userLoginApiCall() async throws {
      
       let result =  try await AuthenticationManager.shared
            .signInUser(email: email, password: password)
        
        print("Result \(result)")
    }
}
