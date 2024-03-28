//
//  ClothingCard.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-24.
//

import Foundation
import SwiftUI

struct ClothingCard : View {
    @EnvironmentObject var cartVM : CartViewModel
    @EnvironmentObject var favVM : FavouriteViewModel
    @State private var refresh = false
    
    var itemDM: ItemDataModel
    
    var body: some View{
        ZStack(alignment: .topTrailing){
            ZStack(alignment: .bottom){
                Image(itemDM.imageName)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 150,height: 180)
                    .scaledToFit()
                HStack{
                    VStack(alignment: .leading){
                        Text(itemDM.name)
                            .bold()
                        Text("\(itemDM.price, specifier: "%.2f") $")
                            .font(.caption)
                    }
                    Spacer()
                    Button{
                        favVM.addToFavourite(item: itemDM)
                    } label: {
                        Image(systemName: "heart.fill")
                            .imageScale(.large)
                            .foregroundColor(.red)
                    }
                    
                }
                .padding()
                .frame(width: 150, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            //.frame(width:100,height: 180)
            .shadow(radius: 7)
            
            Button(action: {
                cartVM.addToCart(item: itemDM)
            }, label: {
                Circle()
                    .frame(width: 38)
                    .foregroundColor(.gray)
                    .shadow(radius: 15)
                    .overlay{
                        Image(systemName: "eye")
                            //.padding(1)
                            .foregroundColor(.black)
                        //.background(.gray)
                            .cornerRadius(50)
                            .imageScale(.medium)
                            .padding()
                    }
                
            })
        }
    }
}

#Preview{
    ClothingCard(itemDM : sampleItemData[0])
}
