//
//  ContentView.swift
//  FirebaseDemo
//
//  Created by Deepu mishra on 01/04/26.
//

import SwiftUI

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var emailError: String = ""
    @State private var passwordError: String = ""
    
    @State private var isFormValid: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Login")
                .font(.largeTitle)
                .bold()
            
            // Email Field
            VStack(alignment: .leading) {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .onChange(of: email) {
                        validateEmail()
                        validateForm()
                    }
                
                if !emailError.isEmpty {
                    Text(emailError)
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
            
            // Password Field
            VStack(alignment: .leading) {
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .onChange(of: password) {
                        validatePassword()
                        validateForm()
                    }
                
                if !passwordError.isEmpty {
                    Text(passwordError)
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
                    .background(isFormValid ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(!isFormValid)
            
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
    }
    
    // MARK: - Validation
    
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
    
    // MARK: - Actions
    
    func handleLogin() {
        validateEmail()
        validatePassword()
        validateForm()
        
        if isFormValid {
            print("Login successful with email: \(email)")
        }
    }
    
    func handleSignUp() {
        print("Navigate to Sign Up screen")
    }
    
    func handleForgotPassword() {
        if email.isEmpty {
            emailError = "Enter your email to reset password"
        } else if !isValidEmail(email) {
            emailError = "Enter a valid email"
        } else {
            print("Trigger forgot password for: \(email)")
        }
    }
}

#Preview {
    LoginView()
}
