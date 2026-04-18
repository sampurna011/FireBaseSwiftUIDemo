//
//  SignUpViewMode.swift
//  FirebaseDemo
//
//  Created by Deepu mishra on 02/04/26.
//

import Foundation
import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    
    @Published private var email: String = ""
    @Published private var password: String = ""
 
}

extension SignUpViewModel {
    
    func userSignUpApiCall() async throws {
      
        let result =  try await AuthenticationManager.shared.signInUser(
            email: email,
            password: password
        )        
        print("Result \(result)")
    }
}
