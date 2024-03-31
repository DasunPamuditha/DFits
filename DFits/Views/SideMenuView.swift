//
//  SideMenuView.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-31.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isMenuOpen: Bool
    @ObservedObject var userVM: UserViewModel
    @State private var navigateToUserView = false
    @State private var navigateToNotificationsView = false

    var body: some View {
        ZStack {
            // Menu content background
            Color.white
                .edgesIgnoringSafeArea(.all)

            // Menu content
            VStack(alignment: .leading) {
                closeButtonSection
                userProfileSection
                notificationItemSection
                
                Spacer()
            }
            .frame(width: 250)
            .offset(x: isMenuOpen ? 0 : -250)
            .animation(.default)

            // Hidden NavigationLinks
            NavigationLink(destination: UserView(userVM: userVM), isActive: $navigateToUserView) { EmptyView() }
            NavigationLink(destination: NotificationView(), isActive: $navigateToNotificationsView) { EmptyView() }
        }
    }
    var closeButtonSection: some View {
            HStack {
                Button(action: {
                    withAnimation {
                        isMenuOpen = false
                    }
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .imageScale(.large)
                        .padding()
                }
                Spacer()
            }
            .padding(.top, 16)
        }

    var userProfileSection: some View {
        VStack {
            HStack {
                Image(systemName: "person") // Notification bell icon
                    .foregroundColor(.black)
                    .imageScale(.large)
                    .padding(.leading, 20)
                
                VStack(alignment: .leading) {
                    Text(userVM.authenticated ? userVM.username : "Guest")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    if userVM.authenticated {
                        
                    }
                }
                .padding(.leading, 8)
            }
            .padding(.top, 100)
            .padding(.bottom, 30)
            .padding(.leading, 20)
            .onTapGesture {
                navigateToUserView = true
            }
        }
    }

    var notificationItemSection: some View {
        VStack {
            HStack {
                Image(systemName: "bell.fill") // Notification bell icon
                    .foregroundColor(.black)
                    .imageScale(.large)
                    .padding(.leading, 20)
                Text("Notifications")
                    .foregroundColor(.black)
                    .font(.headline)
                    .padding(.leading, 8)
            }
            .padding(.top, 20)
            .onTapGesture {
                navigateToNotificationsView = true
            }
        }
    }
    
    
}
