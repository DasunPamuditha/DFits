//
//  FavouriteView.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-24.
//

import SwiftUI

struct FavouriteView: View {
    
    @EnvironmentObject var favVM : FavouriteViewModel
    
    var body: some View {
            
            List{
                if favVM.items.count > 0 {
                    ForEach(favVM.items,id:\.self){
                        data in
                        FavouriteItemCard(itemDM: data)
                    }
                } else {
                    Text("Your Favourites is Empty")
                }
                
            }
            .frame(width: 370,height: 500)
            .background(Color.color)
        }
        
    }

#Preview {
    FavouriteView()
        .environmentObject(FavouriteViewModel())
}
