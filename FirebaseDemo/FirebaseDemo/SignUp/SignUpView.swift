//
//  SignUpView.swift
//  FirebaseDemo
//
//  Created by Deepu mishra on 02/04/26.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String = ""
    
    @StateObject var viewModel: SignUpViewModel = SignUpViewModel()
    
    var body: some View {
            VStack(spacing: 20) {
              
                // Email
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                // Password
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                // Confirm Password
                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                // Error Message
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                }
                
                // Sign Up Button
                Button(action: {
                    validateAndSignup()
                }) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
            }
            .padding()
            .navigationTitle("Sign Up")
        Spacer()
    }
    
    private func validateAndSignup() {
        errorMessage = ""
        
        guard !email.isEmpty,
              !password.isEmpty,
              !confirmPassword.isEmpty else {
              errorMessage = "All fields are required."
            return
        }
        
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters."
            return
        }
        
        // Proceed with signup logic (API call, etc.)
        print("Signing up with email: \(email)")
    }
}

#Preview {
    SignUpView()
}
