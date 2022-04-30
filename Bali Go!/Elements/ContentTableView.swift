//
//  ContentTableView.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 21.04.2022.
//

import SwiftUI

struct ContentTableView: View {
    
    var contentData: [[String: String]]
    var maxContentIndex: Int {
        return contentData.count - 1
    }
    
    var body: some View {
        VStack {
            ForEach(contentData, id: \.self) { milestone in
                HStack(alignment: .top) {
                    Image(systemName: milestone["Image"] ?? "")
                        .font(.headline)
                        .padding(.trailing, 6)
                        .frame(width: 24, alignment: .center)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(milestone["Primary"] ?? "")
                            .font(.callout.leading(.tight).weight(.medium))
                        Text(milestone["Secondary"] ?? "")
                            .font(.subheadline.leading(.tight))
                            .foregroundColor(.secondary)
                        Divider()
                            .padding(.top, 2)
                            .opacity(maxContentIndex == contentData.firstIndex(of: milestone) ? 0 : 1)
                    }
                }
            }
        }
    }
}

