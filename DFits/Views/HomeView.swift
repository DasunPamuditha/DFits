//
//  HomeView.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-24.
//

import SwiftUI

struct HomeView: View {
    
    
    @StateObject var homeVM : HomeViewModel = HomeViewModel()
    @StateObject var itemVM : ItemViewModel = ItemViewModel()
    @StateObject var userVM : UserViewModel = UserViewModel()
    @StateObject var categoryVM : CategoryViewModel = CategoryViewModel()
    @StateObject var cartVM : CartViewModel = CartViewModel()
    @StateObject var favVM : FavouriteViewModel = FavouriteViewModel()
    @State private var showingItem = false
    @State private var selectedCategory: String?
    @State private var searchString: String = ""
    @State private var isMenuOpen: Bool = false
    var colomns = [GridItem(.adaptive(minimum: 160), spacing: 0)]
    
    var body: some View {
        //var searchText: String="null"
        ZStack{
            NavigationView{
                VStack(spacing: 20){
                    //Welcome band
                    HStack{//the welcome note and the cart icon
                        
                        
                        RoundedRectangle(cornerRadius: 0)
                            .frame(width: 330,height: 40)
                            .padding(.horizontal,10)
                            .opacity(0)
                            .overlay{
                                HStack{
                                    HStack{
                                        VStack{
                                            Text("Welcome to D'Fits").font(.custom("SF Armenian",size: 15))
                                            if userVM.authenticated {
                                                Text(userVM.username).bold()
                                            } else {
                                                Text("Good Evening Dasun!").bold()
                                            }
                                        }
                                    }
                                    Spacer()
                                    NavigationLink(destination:{
                                        //EmptyView()
                                        CartView()
                                            .toolbar(.hidden, for:.tabBar)
                                    },label: {
                                        CartButton(numberOfProducts: cartVM.items.count)
                                    })
                                }
                            }
                        
                    }
                    .onAppear{
                        if userVM.authenticated{
                            cartVM.fetchCartData(forEmail: userVM.username)
                        }
                    }
                    
                    HStack{//Item Search bar
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height:40)
                            .padding(.horizontal,10)
                            .foregroundColor(Color("DefaultRectangleBg"))
                            .overlay{
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    TextField("What are you looking for...",text: $searchString)
                                        .onChange(of: searchString) {  _ in
                                            itemVM.fetchData(category: selectedCategory ?? "All", searchString: searchString)
                                        }
                                }.padding(.horizontal,48)
                            }
                    }
                    
                    HStack{// Show the basic categories
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 320,height: 25)
                            .padding(.horizontal, 15 )
                            .opacity(0)
                            .overlay{
                                ScrollView(.horizontal){
                                    
                                    LazyHStack{
                                        Button {
                                            itemVM.fetchData()
                                        } label: {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 90,height: 30)
                                                .foregroundColor(Color("DefaultRectangleBg"))
                                                .overlay{
                                                    Text("All")
                                                }
                                        }
                                        ForEach(categoryVM.categories, id: \.self){
                                            data in
                                            Button {
                                                selectedCategory = data
                                                itemVM.fetchData(category: selectedCategory ?? "Mens",searchString: self.searchString)
                                            } label: {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .frame(width: 90,height: 30)
                                                    .foregroundColor(Color("DefaultRectangleBg"))
                                                    .overlay{
                                                        Text(data)
                                                    }
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal,10)
                        
                    }
                    .padding(.horizontal,5)
                    
                    ScrollView{
                        LazyVGrid(columns: colomns, spacing: 20){
                            ForEach(itemVM.itemDM){
                                cloth in
                                ClothingCard(itemDM: cloth,favVM: favVM, userVM: userVM)
                                        //.environmentObject(cartVM)
                            }
                        }
                    }
                    
                    
                    
                }
                .padding(.top)
                                .preferredColorScheme(.light)
                                .frame(alignment: .bottom)
                                .offset(x: isMenuOpen ? 250 : 0) // Slide the view to the right when the menu is open
                                .disabled(isMenuOpen)
                                .navigationBarItems(leading: Button(action: {
                                    withAnimation {
                                        isMenuOpen.toggle()
                                    }
                                }) {
                                    Image(systemName: "line.horizontal.3") // Hamburger button icon
                                        .foregroundColor(.primary)
                                })
                                .navigationBarTitle("Home", displayMode: .inline)
                                                .offset(x: isMenuOpen ? 250 : 0)
                                                .disabled(isMenuOpen)
                                                .blur(radius: isMenuOpen ? 10 : 0)
                                            }
                                            .navigationViewStyle(StackNavigationViewStyle())

                                            // Side Menu
            if isMenuOpen {
                                SideMenuView(isMenuOpen: $isMenuOpen, userVM: userVM)
                            }
                        }
                        .navigationBarItems(leading: HamburgerMenuButton(isMenuOpen: $isMenuOpen))
                        .navigationBarTitle("Home", displayMode: .inline)
                    }
                }
            


struct HamburgerMenuButton: View {
    @Binding var isMenuOpen: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                isMenuOpen.toggle()
            }
        }) {
            Image(systemName: "line.horizontal.3")
                .foregroundColor(.primary)
                .imageScale(.large)
        }
    }
}



#Preview {
    HomeView()
}
