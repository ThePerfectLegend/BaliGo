//
//  Category Home.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 17.05.2021.
// Череда вью на главном экране с набором элементов в категории

import SwiftUI

struct Category_Home: View {
    
    @EnvironmentObject var modelData: LandmarkViewModel
    private var numberOfcategoriyes: Int {
        modelData.arrayOfSortedCategories.count
    }
    
    var body: some View {
        ForEach(0..<numberOfcategoriyes, id:\.self) { index in
            Small_Cards_Category_View(categoryName: modelData.arrayOfSortedCategories[index], items: modelData.arrayOfSortedLandmarks[index])
        }
        .padding(.bottom, 12)
    }
}





