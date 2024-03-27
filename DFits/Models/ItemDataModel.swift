//
//  ItemDataModel.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-24.
//

import Foundation

struct ItemDataModel: Identifiable, Hashable {
    let id: UUID
    var imageName: String
    var price: Double
    var name: String

    init(imageName: String, price: Double, name: String) {
        self.id = UUID()
        self.imageName = imageName
        self.price = price
        self.name = name
    }
}

// Sample data for testing
let sampleItemData = [
    ItemDataModel(imageName: "item1", price: 10.00, name: "T-Shirt"),
    ItemDataModel(imageName: "item1", price: 20.45, name: "Shorts"),
    ItemDataModel(imageName: "item1", price: 30.70, name: "Trousers"),
    ItemDataModel(imageName: "item1", price: 40.90, name: "Frock"),
    ItemDataModel(imageName: "item1", price: 60.30, name: "Denim")
]
