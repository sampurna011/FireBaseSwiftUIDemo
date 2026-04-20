//
//  TabView.swift
//  FirebaseDemo
//
//  Created by Deepu mishra on 19/04/26.
//

import SwiftUI

struct RootTabView: View {
    @State private var currentTabView: Int = 0
    
    var body: some View {
        TabView(selection: $currentTabView) {
            Color.blue
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(1)
            Color.red
                .tabItem  {
                    Image(systemName: "globe")
                    Text("Browse")
                }
                .tag(2)
            
            Color.green
                .tabItem  {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(3)
        }
    }
}

#Preview {
    RootTabView()
}
