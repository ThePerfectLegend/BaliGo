//
//  ActivityDetailCard.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 16.04.2022.
//

import SwiftUI

struct ActivityDetailView: View {
    
    var activity: Activity
    var utm_campaign: String
    private var featuredLink: String {
        return activity.link + utm_campaign
    }
    
    @EnvironmentObject var viewModel: ActivityViewModel
    @EnvironmentObject var userPreferencesVM: UserPreferencesViewModel
    
    var activityIndex: Int {
        viewModel.activities.firstIndex(where: { $0.id == activity.id })!
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var descSheet = false
    
    var featuredPrice: [String] {
        var _featuredPrice = activity.price
        _featuredPrice.removeValue(forKey: userPreferencesVM.currency)
        
        return _featuredPrice
            .map { key, value in
                String("\(value.formattedWithSeparator) \(key.rawValue)")
            }
            .sorted(by: >)
    }

        
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.vertical) {
                VStack {
                    GeometryReader { reader -> AnyView in
                        let offset = reader.frame(in: .global).minY
                        return AnyView(
                            Image(activity.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.width * 0.5) + (offset > 0 ? offset : 0))
                                .clipped()
                                .offset(y: (offset > 0 ? -offset : 0))
                        )
                    }
                    .frame(height: UIScreen.main.bounds.width * 0.5)
                }
                VStack(alignment: .leading, spacing: 12) {
                    header
                    SmallDescView(description: activity.description)
                    readMoreButton
                    ContentTableView(contentData: activity.milestoneContent)
                    BookingBotton
                }
                .padding([.horizontal, .bottom,], 12)
            }
        }
        .navigationBarHidden(true)
//        .navigationBarTitleDisplayMode(.large)
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(
//            leading: CustomBackButton(presentationMode: presentationMode),
//            trailing: HStack {
//                ShareButton(featuredLink: featuredLink)
//                LikeButtonActivityDetail(activity: $viewModel.activities[activityIndex])
//            }
//        )
        .sheet(isPresented: $descSheet) {
            EmptyView()
        }
    }
    
    private var header: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(activity.name).font(.title3.weight(.semibold))
                .lineLimit(3)
            HStack(alignment: .bottom) {
                    Text(activity.type).font(.callout.weight(.semibold))
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                Spacer()
                    ActivityRaitingView(activity: activity, numberOfReviews: false)
                        .onTapGesture {
                            UIApplication.shared.open(URL(string: featuredLink + "&utm_content=reviews" + "#travelers-reviews")!)
                        }
            }
        }
    }
    
    private var readMoreButton: some View {
        Button {
            descSheet = true
        } label: {
            Text("Подробное описание \(Image(systemName: "chevron.forward.square.fill"))")
                .font(.callout.weight(.semibold))
        }
    }
    
    private var BookingBotton: some View {
        Button {
            UIApplication.shared.open(URL(string: featuredLink + "&utm_content=booking" + "#product")!)
        } label: {
            VStack(alignment: .center) {
                Text("Заказать")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(LinearGradient(gradient: Gradient(colors: [Color.baliGo, Color.baliGoSec]),
                                       startPoint: .init(x: 1.2, y: 0.21),
                                       endPoint: .init(x: -0.5, y: 0.79)))
            .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
        }
    }
    
}
