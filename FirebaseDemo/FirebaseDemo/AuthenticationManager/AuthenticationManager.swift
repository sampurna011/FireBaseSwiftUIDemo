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
    
    
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        
        let authDataResult =  try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(userData: authDataResult.user)
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
