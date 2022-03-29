//
//  Event_Main.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 02.02.2022.
//

import SwiftUI

struct Event_Main: View {
    
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
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            Image(uiImage: eventPoster)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 339, height: 339)
                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
            VStack(alignment: .leading) {

                Text(event.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)

                Text(event.place)
                    .font(.headline)
                    .lineLimit(2)

                Text("\(event.eventStartDate, formatter: Self.stackDateFormat)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
        .frame(width: 339)
    }
}
