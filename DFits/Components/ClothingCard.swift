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
    
    var itemDM: ItemDataModel
    
//    var imageName: String
//    var name : String
//    var price : Double
    
    var body: some View{
        ZStack(alignment: .topTrailing){
            ZStack(alignment: .bottom){
                Image(itemDM.imageName)
                    .resizable()
                    .cornerRadius(10)
                    .frame(width: 150,height: 180)
                    .scaledToFit()
                VStack(alignment: .leading){
                    Text(itemDM.name)
                        .bold()
                    Text("\(itemDM.price, specifier: "%.2f") $")
                        .font(.caption)
                                  
                }
                .padding()
                .frame(width: 150, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .foregroundColor(.color.opacity(0.5)) 
            }
            .frame(width:100,height: 180)
            .shadow(radius: 3)
            
            Button{
                cartVM.addToCart(item: itemDM)
            } label: {
                Image(systemName: "cart")
                    .padding(1)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding(.horizontal,5)
                    //.padding()
            }
        }
    }
}

