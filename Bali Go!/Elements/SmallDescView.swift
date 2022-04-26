//
//  SmallDescView.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 26.04.2022.
//

import SwiftUI

struct SmallDescView: View {
    
    var description: String
    
    var body: some View {
        VStack {
            Text(description)
                .font(.callout.leading(.tight))
        }
    }
}


