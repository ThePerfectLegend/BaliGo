////
////  Event Screen.swift
////  Bali Go!
////
////  Created by Nizami Tagiyev on 02.02.2022.
////
//
import SwiftUI

struct Event_Screen: View {
    
    @EnvironmentObject var eventModel: EventModel
    
    var body: some View {
        NavigationView {
                ScrollView {
                    VStack {
                        EventNavigationBar(eventDate: $eventModel.selectedDate)
                        ForEach(eventModel.events) { event in
                            NavigationLink(destination: Event_Detail(event: event)) {
                             Event_Main(event: event)
                                .padding(.bottom, 12)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                }
                .navigationBarHidden(true)

            }
            .padding(.top, 1) /// нет прозрачности
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear { eventModel.fetchEvents() }
        .onChange(of: eventModel.selectedDate) { newValue in
            eventModel.fetchEvents()
        }
    }
}

struct EventNavigationBar: View {
    
    @Binding var eventDate: Date
//    @Binding var showingSheet: Bool
    
    
    let dateRange: ClosedRange<Date> = {
        let date = Date()
        let calendar = Calendar.current
        let startComponents = calendar.dateComponents([.year, .month, .day], from: date)
        let endComponents = calendar.dateComponents([.year, .month, .day], from: calendar.date(byAdding: .day, value: 7, to: date)!)

        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        HStack {
            DatePicker(selection: $eventDate, in: dateRange, displayedComponents: .date) {
                Text("Афиша")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(1)
            }
            
            
          /// кнопка фильтра, убрана до момента достаточного наполнения контентом
//            Button {
//                showingSheet.toggle()
//            } label: {
//                Text("\(Image(systemName: "slider.horizontal.3"))")
//                    .foregroundColor(Color.baliGo)
//                    .fontWeight(.semibold)
//                    .font(.headline)
//                    .padding(.leading, 2)
//            }
//  всплывающее окно по тапу кнопки
//            .sheet(isPresented: $showingSheet) {
//                FilterSheet() }


        }
        .padding(.top, 48)
        .padding(.horizontal, 16)
        .padding(.bottom, 8)
    }
}

struct FilterSheet: View {
    var body: some View {

            Text("Фильтр событий")
                .font(.title)
                .fontWeight(.semibold)
                .lineLimit(1)
                .multilineTextAlignment(.leading)
    }
}
