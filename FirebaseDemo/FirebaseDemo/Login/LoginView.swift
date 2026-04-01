//
//  ContentView.swift
//  FirebaseDemo
//
//  Created by Deepu mishra on 01/04/26.
//

import SwiftUI

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Email Field
                VStack(alignment: .leading) {
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .onChange(of: viewModel.email) {
                            viewModel.validateEmail()
                            viewModel.validateForm()
                        }
                    
                    if !viewModel.emailError.isEmpty {
                        Text(viewModel.emailError)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }
                
                // Password Field
                VStack(alignment: .leading) {
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .onChange(of: viewModel.password) {
                            viewModel.validatePassword()
                            viewModel.validateForm()
                        }
                    
                    if !viewModel.passwordError.isEmpty {
                        Text(viewModel.passwordError)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }
                
                // Forgot Password Button
                HStack {
                    Spacer()
                    Button("Forgot Password?") {
                        handleForgotPassword()
                    }
                    .font(.caption)
                }
                
                // Sign In Button
                Button(action: {
                    handleLogin()
                }) {
                    Text("Sign In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.isFormValid ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(!viewModel.isFormValid)
                
                // Sign Up Button
                Button(action: {
                    handleSignUp()
                }) {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: 1)
                        )
                }
                
            }
            .padding()
            .navigationTitle("Login")
        }
    }
    
    // MARK: - Actions
    
    func handleLogin() {
        viewModel.validateEmail()
        viewModel.validatePassword()
        viewModel.validateForm()
        
        if viewModel.isFormValid {
            print("Login successful with email: \(viewModel.email)")
        }
    }
    
    func handleSignUp() {
        print("Navigate to Sign Up screen")
    }
    
    func handleForgotPassword() {
//        if email.isEmpty {
//            emailError = "Enter your email to reset password"
//        } else if !isValidEmail(email) {
//            emailError = "Enter a valid email"
//        } else {
//            print("Trigger forgot password for: \(email)")
//        }
    }
}
