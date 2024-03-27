//
//  ItemView.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-24.
//

import SwiftUI

struct ItemView: View {
    
    @StateObject var itemVM : ItemViewModel = ItemViewModel()
    
    var body: some View {
        
        //var searchText: String="null"
        ZStack{
            VStack(spacing: 20){
                HStack{//Navigator Item
                    RoundedRectangle(cornerRadius: 0)
                        .frame(width: 330,height: 40)
                        .padding(.horizontal,10)
                        .opacity(0)
                        .overlay{
                            HStack{
                                HStack{
                                    VStack{
                                        Text("\(itemVM.searchCategory) items").bold()
                                    }
                                }
                                Spacer()
                                HStack{
                                    Image(systemName: "cart")
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.horizontal)
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
                                TextField("Search in all over the Items...",text: $itemVM.searchString)
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
                                        ForEach(itemVM.categoryData,id:\.self){
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
                
                ScrollView{// Show Popular items over here
                    VStack{
                        ForEach(itemVM.itemData,id:\.self){
                            cloth in
                            VStack{
                                HStack(spacing: 90){
                                    ClothingCard(itemDM: cloth)
                                    ClothingCard(itemDM: cloth)
                                }
                            }
                        }
                    }
                }
                
                
                HStack(spacing: 80){//Navigator
                    Image(systemName: "house.fill")
                    Image(systemName: "heart")
                    Image(systemName: "bell")
                    Image(systemName: "person")
                }
                
                Spacer()
                
            }
            .padding(.top)
            .preferredColorScheme(.light)
            .navigationBarBackButtonHidden(true)
        }
    }
}
#Preview {
    ItemView()
}
