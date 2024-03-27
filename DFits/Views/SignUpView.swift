//
//  SignUpView.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-25.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
   
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            
            ZStack {
                Color.color
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white.opacity(0.6))
                
                
                //form field
                
                VStack{
                    VStack {
                        Text("New to D'Fits?")
                            .font(.largeTitle)
                            .bold()
                            .padding(20)
      
                        
                        TextField("Type your name here", text: $username)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        
                        TextField("Email address", text: $email)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        
                        TextField("Type a Password", text: $password)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            
                        TextField("Re enter your Password", text: $password)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                        
                        
                        
                        
                        Button{
                            print("user signup")
                        } label: {
                            HStack{
                                Text("REGISTER")
                                
                            }
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 32,height:48)
                        }
                        .background(Color(.systemBlue))
                        .cornerRadius(50)
                        
                        .padding(2)
                        
                        Button{
                            dismiss()
                        } label: {
                            HStack{
                                HStack(spacing: 3){
                                    Text("Already have an Account? ")
                                    Text("Sign in")
                                        .bold()
                                }
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                            }
                        }
                    }
                    
                    .padding(.top,24)
                    
                    
                    
                    //sign up button
                    
                    
                    
                    //            NavigationLink{
                    //
                    //            } label : {
                    
                    //                .font(.system(size: 14))
                    //            }
                }
                .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}
#Preview {
    SignUpView()
}
