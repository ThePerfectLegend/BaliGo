//
//  ActivityLandmarkView.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 26.04.2022.
//

import SwiftUI

struct ActivityLandmarkView: View {
    
    var landmark: Landmark
    
    @EnvironmentObject var viewModel: ActivityViewModel
    
    private var activityScenario: Int {
        return activityForLandmark.count
    }
    
    private var activityForLandmark: [Activity] {
        var _activityArray = [Activity]()
        for activityID in landmark.activitiesOnLandmark {
            for activity in viewModel.activities {
                if activityID == activity.id {
                    _activityArray.append(activity)
                }
            }
        }
        return _activityArray
    }
    
    var body: some View {
        switch activityScenario {
        case let x where x > 1:
            fewActivity
        case let x where x == 1:
            oneActivity
        default:
            EmptyView()
        }
    }
    
    private var oneActivity: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading) {
                Text("Активности").font(.title3.weight(.semibold))
//                Text("Посетите \(landmark.name) в составе тура или экскурсии")
//                    .font(.callout.weight(.semibold))
//                    .foregroundColor(.secondary)
            }
            
            NavigationLink(destination: ActivityDetailView(activity: activityForLandmark.first!, utm_campaign: "&utm_campaign=landmark")) {
                ActivitySecondaryCard(activity: activityForLandmark.first!, widthInfinity: true)
            }
            .buttonStyle(PlainButtonStyle())
            .contentShape(Rectangle())
            Divider()
        }
        .padding(.horizontal, 12)
    }
    
    private var fewActivity: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Активности").font(.title3.weight(.semibold))
//                    Text("Посетите \(landmark.name) в составе тура или экскурсии")
//                        .font(.callout.weight(.semibold))
//                        .foregroundColor(.secondary)
                }
                
                //                Spacer()
                //                Text("Показать все").font(.body)
                //                    .foregroundColor(.baliGo)
            }
            .padding(.horizontal, 12)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(activityForLandmark) { activity in
                        NavigationLink(destination: ActivityDetailView(activity: activity, utm_campaign: "&utm_campaign=landmark")) {
                            ActivitySecondaryCard(activity: activity, widthInfinity: false)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, 12)
            }
            Divider()
                .padding(.horizontal, 12)
        }
    }
    
}

