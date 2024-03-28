//
//  ItemView.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-24.
//

import SwiftUI

struct ItemView: View {
    
    @StateObject var itemVM : ItemViewModel = ItemViewModel()
    @State private var getSelection:Int = 0
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Image("item1")
                    .resizable()
                    .cornerRadius(35)
                    .frame(width: 350,height: 400)
                    .scaledToFit()
                Spacer()
                VStack{
                    HStack{
                        Text("Long Sleve 16 1/2")
                        Spacer()
                        Text("$ 54.00")
                    }
                    .padding(30)
                }
                //Spacer()
                VStack{
                    HStack{
                        Circle()
                            .frame(width: 40)
                            .foregroundColor(getSelection != 0 ? Color.gray : Color.black)
                            .overlay{
                                Button(action: {
                                    getSelection = 0
                                }, label: {
                                    Text("S")
                                })
                                .tint(.white)
                                
                            }
                        Circle()
                            .frame(width: 40)
                            .foregroundColor(getSelection != 1 ? Color.gray : Color.black)
                            .overlay{
                                Button(action: {
                                    getSelection = 1
                                }, label: {
                                    Text("M")
                                })
                                .tint(.white)
                                
                            }
                        Circle()
                            .frame(width: 40)
                            .foregroundColor(getSelection != 2 ? Color.gray : Color.black)
                            .overlay{
                                Button(action: {
                                    getSelection = 2
                                }, label: {
                                    Text("L")
                                })
                                .tint(.white)
                                
                            }
                        Circle()
                            .frame(width: 40)
                            .foregroundColor(getSelection != 3 ? Color.gray : Color.black)
                            .overlay{
                                Button(action: {
                                    getSelection = 3
                                }, label: {
                                    Text("XL")
                                })
                                .tint(.white)
                                
                            }
                    }
                }
                Spacer()
                Button{
                    print("adding to cart")
                } label: {
                    HStack{
                        Text("Add to Cart")
                            .foregroundStyle(.white).bold()
                            
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32,height:48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(50)
                //Spacer()
            }
            
        }
        //.ignoresSafeArea()
    }
}
#Preview {
    ItemView()
}
