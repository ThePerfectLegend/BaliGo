//
//  All Buttom.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 30.05.2021.
//

import SwiftUI

struct All_Buttom: View {
    
    var array: [Landmark]
    var category: String
    
    var body: some View {
        NavigationLink( destination: All_Category_Screen(category: category)) {
            Text("Показать все")
                .foregroundColor(.baliGo)
                .font(.body)
        }
    }
}
