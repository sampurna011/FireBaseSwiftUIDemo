//
//  AuthenticationManager.swift
//  FirebaseDemo
//
//  Created by Deepu mishra on 18/04/26.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager {
   
    static let shared = AuthenticationManager()
    private init() { }
    
    // For get current user data
    func getAuthenticUser() async throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return AuthDataResultModel(userData: user)
    }
    
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        
        let authDataResult =  try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(userData: authDataResult.user)
    }
    
    
    func  signInUser(email: String, password: String) async throws -> AuthDataResultModel {
        
        let authDataResult =  try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(userData: authDataResult.user)
        
    }
    
    // For Logout
    func signOut() throws {
        try Auth.auth().signOut()
    }
}


struct AuthDataResultModel {
    let uiD: String
    let email: String?
    let photoUrl: String?
    
    init(userData: User) {
        self.uiD = userData.uid
        self.email = userData.email
        self.photoUrl = userData.photoURL?.absoluteString
    }
}
