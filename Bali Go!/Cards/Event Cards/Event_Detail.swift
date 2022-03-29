//
//  Event_Detail.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 11.02.2022.
//

import SwiftUI

struct Event_Detail: View {
    
    var event: Event
    
    var eventPoster: UIImage {
        let data = try! Data(contentsOf: event.imageURL)
        let image = UIImage(data: data)!
        return image
    }
    
    static let stackDateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, d MMM HH:mm"
            return formatter
        }()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView{
                VStack{
                            Image(uiImage: eventPoster)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                    }
                
                VStack(alignment: .leading) {
                    Group {
                        Text(event.place)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {

                        Text("\(event.eventStartDate, formatter: Self.stackDateFormat)")
                            .font(.subheadline)
                            .lineLimit(2)
                        
                        Spacer()
                            
                        Text("\(Image(systemName: "location.fill")) 24.5km")
                            .font(.subheadline)
                        }
                        
                        Divider()
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Вход")
                                .font(.title3)
                                .fontWeight(.semibold)
                            EventEnter(event: event)
                        }

                        EventDesc(event: event)
                            .padding(.bottom, 8)
                        
                        Go(coordinate: event.location)
                            .padding(.bottom, 12)




                                                
                        }
                        .padding(.horizontal, 12)
                                        
                }
        }

        }
        .navigationBarHidden(false)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(event.name)
    }
}


struct EventEnter: View {
    
    var event: Event

    
    var samePrice: Bool {
        if event.price.count == 1 || event.price[0] == event.price[1] {
            return true
        } else {
            return false
        }
    }
    
    var samePriceOption: String {
        if event.price[0] == 0 {
            return "Бесплатно!"
        } else {
            return String("\(event.price[0]) IDR")
        }
    }
    
    var womanPrice: String {
        if event.price[0] == 0 {
            return "Дамам бесплатно!"
        } else {
            return String("Дамы: \(event.price[0]) IDR")
        }
    }
    
    var manPrice: String {
        if event.price[1] == 0 {
            return "Господам бесплатно!"
        } else {
            return String("Господа: \(event.price[1]) IDR")
        }
    }
    
    var enterOption: Bool {
        if event.enterOption != nil {
            return true
        } else {
            return false
        }
    }
    

    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if samePrice {
                Text("\(samePriceOption)")
            } else {
                Text(womanPrice)
                Text(manPrice)
            }
            
            if enterOption {
                Text("\(Image(systemName: "info.circle")) ")
                    .foregroundColor(.baliGo)
                + Text(event.enterOption!)
            } else {
                EmptyView()
            }
        }
    }
}



struct EventDesc: View {
    
    var event: Event
    
    var showDesc: Bool {
        if event.description != nil {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if showDesc {
                Divider()
                VStack(alignment: .leading, spacing: 4) {
                Text("Описание")
                    .font(.title3)
                    .fontWeight(.semibold)
                    ExpandableText(event.description!, lineLimit: 8)
                    .fixedSize(horizontal: false, vertical: true)
                }
            } else {
                EmptyView()
            }
        }
    }
}
