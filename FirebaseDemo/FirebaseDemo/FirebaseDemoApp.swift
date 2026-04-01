//
//  FirebaseDemoApp.swift
//  FirebaseDemo
//
//  Created by Deepu mishra on 01/04/26.
//

import SwiftUI
import FirebaseCore

@main
struct FirebaseDemoApp: App {
    
   // @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        FirebaseApp.configure()
        print("FirebaseApp configure")
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}



class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
