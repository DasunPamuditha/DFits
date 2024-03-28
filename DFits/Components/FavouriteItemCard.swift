//
//  FavouriteItemCard.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-28.
//

import Foundation
import SwiftUI

struct FavouriteItemCard : View {
    
    var itemDM : ItemDataModel
    
    var body: some View{
        HStack{
            Image(itemDM.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
            VStack{
                Text(itemDM.name)
                Text("\(itemDM.price, specifier: "%.2f") $")
            }.padding()
        }
        .padding(.horizontal,2)
        .foregroundStyle(.black.opacity(0.8))
        .swipeActions(edge: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/,content: {
            Button(action: {
                withAnimation{
                    //cartVM.removeFromCart(item: itemDM)
                }
            }, label: {
                Text("Remove")
            }).tint(.red)
        })
        
    }
}
#Preview {
    UserView()
    //test
}
