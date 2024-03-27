//
//  CartDataModel.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-24.
//

import Foundation
import SwiftUI

struct CartDataModel : Hashable{
    var cartItemID: String = UUID().uuidString
    var image : String
    var name: String
    var size: String
    var price: String
    var quantity: String
}

var sampleCartData = [CartDataModel(image: "trash.square.fill", name: "String", size: "String", price: "String", quantity: "Int"),
                      CartDataModel(image: "trash.square.fill", name: "String", size: "String", price: "String", quantity: "Int"),
                      CartDataModel(image: "trash.square.fill", name: "String", size: "String", price: "String", quantity: "Int")]

