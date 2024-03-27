//
//  CartViewModel.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-24.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published private(set) var items: [ItemDataModel] = []
    @Published private(set) var total: Double = 0.00
    
    init() {
        // Initialize with some sample data for testing
        items = sampleItemData
        recalculateTotal()
    }
    
    func addToCart(item: ItemDataModel) {
        items.append(item)
        recalculateTotal()
    }
    
    func removeFromCart(item: ItemDataModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items.remove(at: index)
            recalculateTotal()
        }
    }
    
    private func recalculateTotal() {
        total = items.reduce(0) { $0 + $1.price }
    }
}
