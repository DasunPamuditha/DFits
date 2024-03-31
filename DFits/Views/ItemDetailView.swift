//
//  ItemDetailView.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-30.
//

import SwiftUI

struct ItemDetailView: View {
    
    //@State var itemDM = [ItemDataModel]()
    //@EnvironmentObject var cartVM : CartViewModel
    //@StateObject var userVM = UserViewModel()
    @StateObject var itemDetailsVM = ItemDetailViewModel()
    @State var getSelection : String = ""
    @State var quantity : String = ""
    @State private var showAlert = false
    var itemDM: ItemDataModel
    var userID: String
    
    var body: some View {
        
        NavigationView{
            ZStack{
                VStack{
                    
                    let imageURL = URL(string: itemDM.prod_image)!
                    AsyncImage(url: imageURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView() // Placeholder while loading
                                .cornerRadius(10)
                                .cornerRadius(10)
                                .frame(width: .infinity,height: 400)
                        case .success(let image):
                            image
                                .resizable()
                                .frame(width: .infinity,height: 400)
                                .scaledToFill()
                                .padding()
                        case .failure(let error):
                            Text("Failed to load image")
                                .foregroundColor(.red)
                                .padding()
                                .frame(width: 160,height: 190)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.red, lineWidth: 1)
                                )
                                .onTapGesture {
                                    print("Error loading image: \(error.localizedDescription)")
                                }
                        default:
                            //EmptyView()
                            Image("item2")
                                .resizable()
                                .frame(width: .infinity,height: 400)
                                .scaledToFill()
                                .padding()
                        }
                    }
                    
                    Spacer()
                    Text(itemDM.prod_name)
                        .font(.title)
                        .font(.system(size: 12))
                    Text("$ \(itemDM.prod_price, specifier: "%.2f")")
                    ScrollView{
                        Text("This Item can be purchased from any of our stores. For returns call our team they will arrange you the relevants")
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    
                    
                    //                    ScrollView(.horizontal, showsIndicators: false) {
                    //                        HStack(spacing: 15) {
                    //                            ForEach(["Small", "Medium", "Large", "XL", "XXL"], id: \.self) { size in
                    //                                Button(action: {
                    //                                    selectedSize = size
                    //                                    print("Selected size: \(selectedSize)")
                    //                                }) {
                    //                                    Text(size)
                    //                                        .font(.title)
                    //                                        .padding(4)
                    //                                        .foregroundColor(selectedSize == size ? .black : .white)
                    //                                        .background(selectedSize == size ? Color.gray : Color.color)
                    //                                        .cornerRadius(5)
                    //                                }
                    //                            }
                    //                        }
                    //                    }
                    
                    
                    //Spacer()
                    
                    
                    HStack{
                        Spacer()
//                        Button(action: {
//                            getSelection = "XS"
//                        }, label: {
//                            Circle()
//                                .frame(width: 40)
//                                .foregroundStyle(getSelection == "XS" ? Color.blue : Color.gray)
//                                .overlay {
//                                    Text("XS")
//                                }
//                        })
                        Button(action: {
                            getSelection = "S"
                        }, label: {
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(getSelection == "S" ? Color.blue : Color.gray)
                                .overlay {
                                    Text("S")
                                }
                        })
                        Button(action: {
                            getSelection = "M"
                        }, label: {
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(getSelection == "M" ? Color.blue : Color.gray)
                                .overlay {
                                    Text("M")
                                }
                        })
                        Button(action: {
                            getSelection = "L"
                        }, label: {
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(getSelection == "L" ? Color.blue : Color.gray)
                                .overlay {
                                    Text("L")
                                }
                        })
                        Button(action: {
                            getSelection = "XL"
                        }, label: {
                            Circle()
                                .frame(width: 40)
                                .foregroundStyle(getSelection == "XL" ? Color.blue : Color.gray)
                                .overlay {
                                    Text("XL")
                                }
                        })
                        Spacer()
                        TextField("Enter Quantity", text: $quantity)
                            .font(.system(size: 14))
                        Spacer()
                    }
                    
                    
                    
                    if(itemDetailsVM.showSuccess){
                        Text("Added to cart")
                            .font(.system(size: 12))
                            .foregroundStyle(.green)
                    }
                    
                    if(itemDetailsVM.showError){
                        Text("Unable to Add select color or quantity")
                            .font(.system(size: 12))
                            .foregroundStyle(.red)
                    }
                    
                    Button(action:{
                        if userID.isEmpty || userID == "" {
                            showAlert = true
                        } else {
                            itemDetailsVM.addToCart(itemID: "\(itemDM.id)", userID: userID, size: getSelection, qty: quantity)
                            showAlert = false
                        }
                    },label: {
                        HStack{
                            Text("ADD TO CART")
                                .foregroundStyle(.white).bold()
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32,height:48)
                    })
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Unable to Add to Cart"),
                            message: Text("Make sure to login before add Favourites")
                        )
                    }
                    .background(Color(.systemBlue))
                    .cornerRadius(50)
                    .padding(.top,24)
                    Spacer()
                }
            }
        }
    }
    
    
    //#Preview {
    //    ItemDetailView(itemDM: ItemDataModel)
    //}
}
