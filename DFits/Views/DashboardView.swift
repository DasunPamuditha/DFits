//
//  DashboardView.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-24.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var cartViewModel = CartViewModel()

    var body: some View {
        NavigationStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                FavouriteView()
                    .environmentObject(FavouriteViewModel())
                    .tabItem {
                        Label("Favourites", systemImage: "heart")
                    }
                CartView()
                    .environmentObject(cartViewModel)
                    .tabItem {
                        Label {
                            Text("Cart")
                        } icon: {
                            CartButton(numberOfProducts: cartViewModel.items.count)
                        }
                    }
                UserView()
                    .tabItem {
                        Label("Me", systemImage: "person")
                    }
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
