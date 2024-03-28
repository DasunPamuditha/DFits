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
    @State var getSize:Int = 1
    @State var size:String = "S"
    
    var itemDM : ItemDataModel
    
    var body: some View{
        HStack{
            Image(itemDM.imageName)
                .resizable()
                .frame(width: 90, height: 90)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .frame(width: 150,height: 150)
            //Spacer()
            VStack{
                Text(itemDM.name)
                Text("\(itemDM.price, specifier: "%.2f") $")
            }
            .padding()
            Spacer()
            VStack{
                Circle()
                    .frame(width: 50)
                    .foregroundColor(Color.gray)
                    .overlay{
                        Text(size)
                    }
            }
            Spacer()
        }
        //.padding(.leading)
        .foregroundStyle(.black.opacity(0.8))
        .swipeActions(edge: .trailing,content: {
            Button(action: {
                withAnimation{
                    cartVM.removeFromCart(item: itemDM)
                }
            }, label: {
                Text("Remove")
            }).tint(.red)
        })
        .swipeActions(edge:.leading,content: {
            Button(action: {
                size = "S"
            }, label: {
                Text("S")
            })
            .tint(.green)
            
            Button(action: {
                size = "M"
            }, label: {
                Text("M")
            })
            .tint(.blue)
            
            Button(action: {
                size = "L"
            }, label: {
                Text("L")
            })
            .tint(.yellow)
            
            Button(action: {
                size = "XL"
            }, label: {
                Text("XL")
            })
            .tint(.orange)
        })
        
    }
}

#Preview {
    CartItemCard(itemDM: sampleItemData[0])
}
