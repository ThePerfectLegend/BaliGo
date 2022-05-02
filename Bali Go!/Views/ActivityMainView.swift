//
//  BigCardView.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 04.04.2022.
//

import SwiftUI

struct ActivityMainView: View {

    var activities: [Activity]

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 15) {
                    ForEach(activities, id: \.id) { activity in
                        NavigationLink(destination: ActivityDetailView(activity: activity, utm_campaign: "&utm_campaign=main")) {
                            ActivitySecondaryCard(activity: activity, widthInfinity: false)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, 18)
            }
        }
        .padding(.bottom, 4)
    }
}


