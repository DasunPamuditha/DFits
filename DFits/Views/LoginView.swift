//
//  LoginView.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-24.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var showingLoginScreen = false
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.color
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white.opacity(0.6))

                VStack {
                    Text("Login to D'Fits")
                        .font(.largeTitle)
                        .bold()
                        .padding(30)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                        
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                        .padding(5)
                    
                    Button("Login") {
                        authenticateUser(username: username, password: password)
                        }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: UserView(), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                }
            }.navigationBarHidden(true)
        }
    }
    
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "dasun" {
            wrongUsername = 0
            if password.lowercased() == "123" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
