//
//  ForgotPasswordView.swift
//  FirebaseDemo
//
//  Created by Deepu mishra on 18/04/26.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    var body: some View {
        // Email Field
        VStack(alignment: .leading, spacing: 30) {
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .onChange(of: email) {
                  
                }
            
            Button(action: {
              
            }) {
                Text("Forgot Password")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(email.isEmpty ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
           // .disabled(!viewModel.isFormValid)
     
        }
        .navigationTitle("Forgot Password")
        .padding()
        Spacer()
    }
}

#Preview {
    ForgotPasswordView()
}
