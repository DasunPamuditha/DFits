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
    var colomns = [GridItem(.adaptive(minimum: 160), spacing: 0)]
    
    var body: some View {
        
        //var searchText: String="null"
        ZStack{
            NavigationView{
                
                ZStack {
                    Color.color
                        .ignoresSafeArea()
                    Circle()
                        .scale(1.7)
                        .foregroundColor(.white.opacity(0.15))
                    
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
                                                Text("Good morning Dasun!").bold()
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
                                        TextField("Explore more items",text: $homeVM.searchString)
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
                        
                        HStack{//Message with Image (discounts, downtimes, etc...)
                            RoundedRectangle(cornerRadius: 10)
                                .padding(.horizontal, 10)
                                .frame(height:135)
                                .foregroundColor(Color("DefaultRectangleBg"))
                                .overlay{
                                    HStack{
                                        HStack{
                                            RoundedRectangle(cornerRadius: 0)
                                                .frame(maxHeight: .infinity)
                                                .opacity(0)
                                                .overlay{
                                                    VStack{
                                                        Text("Latest Arivals")
                                                    }
                                                    
                                                }
                                        }
                                        HStack{
                                            RoundedRectangle(cornerRadius: 0)
                                                .frame(maxHeight: .infinity)
                                        }
                                    }.padding(.horizontal,45)
                                    
                                }
                        }
                        
                        ScrollView{
                            LazyVGrid(columns: colomns, spacing: 20){
                                ForEach(itemVM.itemData,id:\.self){
                                    cloth in
                                    //ClothingCard(itemDM.imageName :itemDM.imageName,name :itemDM.name,price:itemDM.price)
                                    ClothingCard(itemDM: cloth)
                                        .environmentObject(cartVM)
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
}


#Preview {
    HomeView()
}
