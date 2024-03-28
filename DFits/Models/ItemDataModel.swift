//
//  ItemDataModel.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-24.
//

import Foundation
import SwiftUI

struct ItemDataModel : Hashable{
    //popular clothing data
    var clothID = UUID().uuidString
    var imageName : String
    var price : Double
    var name : String
}

//Image(systemName: "square.and.pencil.circle.fill")
var sampleItemData = [ItemDataModel(imageName: "item1", price: 10.00, name: "test1"),
                          ItemDataModel(imageName: "item1", price: 20.45, name: "test2"),
                          ItemDataModel(imageName: "item1", price: 30.7, name: "test3"),
                          ItemDataModel(imageName: "item1", price: 40.9, name: "test4"),
                          ItemDataModel(imageName: "item1", price: 60.3, name: "test5")]
