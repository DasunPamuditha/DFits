//
//  DashboardView.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-24.
//

import SwiftUI

struct DashboardView: View {
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
                    
                    TabView{
                        HomeView()
                            .tabItem {
                                Label("Home",systemImage: "house")
                            }
                        FavouriteView()
                            .tabItem {
                                Label("Favourites",systemImage: "heart")
                            }
                        NotificationView()
                            .tabItem {
                                Label("Notifications",systemImage: "bell")
                            }
                        UserView()
                            .tabItem {
                                Label("Me",systemImage: "person")
                            }
                        
                        CartView()
                            .tabItem {
                                Label("Cart",systemImage: "cart")
                            }
                    }
                }
                //.navigationBarBackButtonHidden(true)
            }
        }
    }

#Preview {
    DashboardView()
}
