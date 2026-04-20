//
//  SignUpView.swift
//  FirebaseDemo
//
//  Created by Deepu mishra on 02/04/26.
//

import SwiftUI

struct SignUpView: View {
 
    @State private var errorMessage: String = ""
    
    @StateObject var viewModel: SignUpViewModel = SignUpViewModel()

    
    var body: some View {
            VStack(spacing: 20) {
              
                // Email
                TextField("Email", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
       
                // Password
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                // Confirm Password
                SecureField("Confirm Password", text: $viewModel.confirmPassword)
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
        
        guard !viewModel.email.isEmpty,
              !viewModel.password.isEmpty,
              !viewModel.confirmPassword.isEmpty else {
              errorMessage = "All fields are required."
            return
        }
        
        guard viewModel.password == viewModel.confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }
        
        guard viewModel.password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters."
            return
        }
                
        Task {
            do {
                try await viewModel.userSignUpApiCall() 
            } catch {
                errorMessage = error.localizedDescription
            }
           
        }
    }
}

#Preview {
    SignUpView()
}
