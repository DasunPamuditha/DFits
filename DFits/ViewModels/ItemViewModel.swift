//
//  ItemViewModel.swift
//  DFits
//
//  Created by Dasun Pamuditha on 2024-03-24.
//

import Foundation
import SwiftUI

class ItemViewModel : ObservableObject {
    @Published var itemData = sampleItemData
    @Published var categoryData = sampleCategoryData
    @Published var searchString : String = ""
    @Published var searchCategory : String = "All"
}
