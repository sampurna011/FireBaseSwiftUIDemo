//
//  Router.swift
//  FirebaseDemo
//
//  Created by Deepu mishra on 18/04/26.
//


import SwiftUI
import Combine



class AuthRouter: ObservableObject {
    
    @Published var path = NavigationPath()

    func goToSignup() {
        path.append(AuthRoute.signup)
    }

    func goToForgotPassword() {
        path.append(AuthRoute.forgotPassword)
    }

    func resetToLogin() {
        path = NavigationPath()
    }
}


enum AuthRoute: Hashable {
    case login
    case signup
    case forgotPassword
}
