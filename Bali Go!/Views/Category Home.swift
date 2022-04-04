//
//  Category Home.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 17.05.2021.
// Череда вью на главном экране с набором элементов в категории

import SwiftUI

struct Category_Home: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
            Small_Cards_Category_View(categoryName: key, items: modelData.categories[key]!)
        }
        .padding(.bottom, 8)
    }
}
