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
    @StateObject var cartVM : CartViewModel = CartViewModel()
    @StateObject var favVM : FavouriteViewModel = FavouriteViewModel()
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
                                            Text("Good Evening Dasun!").bold()
                                        }
                                    }
                                    Spacer()
                                    NavigationLink(destination:{
                                        //EmptyView()
                                        CartView()
                                            .environmentObject(cartVM)
                                            .toolbar(.hidden, for:.tabBar)
                                    },label: {
                                        CartButton(numberOfProducts: cartVM.items.count)
                                    })
                                }
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
                                    TextField("What are you looking for...",text: $homeVM.searchString)
                                }.padding(.horizontal,55)
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
                                        ForEach(homeVM.categoryData,id:\.self){
                                            category in
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 90,height: 30)
                                                .foregroundColor(Color("DefaultRectangleBg"))
                                                .overlay{
                                                    Text(category.categoryName)
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
                            ForEach(itemVM.itemData,id:\.self){
                                cloth in
                                ClothingCard(itemDM: cloth)
                                    .environmentObject(cartVM)
                                    .environmentObject(favVM)
                            }
                        }
                    }
                    

                    
                }
                .padding(.top)
                .preferredColorScheme(.light)
                .frame(alignment: .bottom)
                Spacer()
                
            }
            //.toolbar(.hidden, for: .navigationBar)
        }
    }
    
    
}



#Preview {
    HomeView()
}
