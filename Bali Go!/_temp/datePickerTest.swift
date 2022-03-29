//
//  datePickerTest.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 15.02.2022.
//

import SwiftUI

struct datePickerTest: View {
    
    @State var selectedDate = Date()
    
    var body: some View {
        if #available(iOS 15.0, *) {
            DatePicker("Hello", selection: $selectedDate, displayedComponents: .date)
                .tint(.red)
        } else {
            DatePicker("Hello", selection: $selectedDate, displayedComponents: .date)
                .accentColor(.red)
        }
    }
}

