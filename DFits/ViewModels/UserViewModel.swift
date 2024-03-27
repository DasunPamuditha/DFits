//
//  UserViewModel.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-24.
//

import Foundation
import SwiftUI


class UserViewModel : ObservableObject{
    @AppStorage("AUTH_KEY") var authenticated = false{
        willSet {objectWillChange.send()}
    }
    @AppStorage("USER_KEY") var username = "abc"
    
    @Published var password : String = ""
    @Published var showError : Bool = false
    @Published var errorMessage : String = ""
    @Published var success : Bool = false
    @Published var email : String = "abc@abc.lk"
    
    func verifyLogin(){
        if username.isEmpty || password.isEmpty{
            showError = true
            errorMessage = "Username and Password cannot be empty!"
        }else if(username.lowercased()=="dasun" && password=="123"){
            showError = false
            success = true
            authenticated = true
        }else{
            showError = true
            errorMessage = "Username and Password mismatched. Please try again!"
        }
    }
    
    func logout() {
        self.password = ""
        
        withAnimation{
            authenticated.toggle()
        }
    }
}

