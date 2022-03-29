//
//  Close Detail View Button.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 19.04.2021.
//

import SwiftUI

struct Close_Detail_View_Button: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
            ZStack {
                Image(systemName: "chevron.backward.circle")
                    .foregroundColor(Color.white)
                    .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct Close_Detail_View_Button_Previews: PreviewProvider {
    static var previews: some View {
        Close_Detail_View_Button()
    }
}



