//
//  CartItemCard.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-24.
//

import Foundation
import SwiftUI

struct CartItemCard : View {
    @EnvironmentObject var cartVM : CartViewModel
    
    var itemDM : ItemDataModel
//    var imageName : String
//    var name : String
//    var price : String
    
    var body: some View{
            RoundedRectangle(cornerRadius: 10)
                .frame(width:350,height: 120)
                .padding(.horizontal)
                .foregroundColor(.color.opacity(0.5))
                .overlay{
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
                    .padding(.horizontal,30)
                    .foregroundStyle(.black.opacity(0.8))
                    .swipeActions(edge: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/,content: {
                        Button(action: {
                            withAnimation{
                                cartVM.removeFromCart(item: itemDM)
                            }
                        }, label: {
                            Text("Remove")
                        }).tint(.red)
                    })
                }
        Text(itemDM.name)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
    }
}
