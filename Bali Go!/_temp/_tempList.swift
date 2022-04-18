//
//  _tempList.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 18.04.2022.
//

import SwiftUI

struct _tempList: View {
    
//    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    var body: some View {
        VStack {
            List {
                Section {
                    // 1
                    HStack {
                        Image(systemName: "clock")
                            .font(.title3)
                            .padding(.trailing, 4)
//                            .foregroundColor(.baliGo)
                            .frame(width: 25, height: 25, alignment: .center)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Длительность 8 часов")
                                .font(.callout)
                                .fontWeight(.medium)
                            Text("Восхождение на вулкан начнется около 4 утра")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                   // 2
                    HStack {
                        Image(systemName: "car.fill")
                            .font(.title3)
                            .padding(.trailing, 4)
//                            .foregroundColor(.baliGo)
                            .frame(width: 25, height: 25, alignment: .center)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Трансфер включен")
                                .font(.callout)
                                .fontWeight(.medium)
                            Text("Из отеля/виллы и обратно")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    // 3
                    HStack {
                        Image(systemName: "leaf.fill")
                            .font(.title3)
                            .padding(.trailing, 4)
                            .foregroundColor(.baliGo)
                            .frame(width: 25, height: 25, alignment: .center)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Легкий завтрак")
                                .font(.callout)
                                .fontWeight(.medium)
                            Text("Перед началом подъема и на вершине")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    // 4!
                    HStack {
                        Image(systemName: "person.2.fill")
                            .font(.title3)
                            .padding(.trailing, 4)
                            .foregroundColor(.baliGo)
                            .frame(width: 25, height: 25, alignment: .center)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Подъем с гидом-проводником")
                                .font(.callout)
                                .fontWeight(.medium)
                            Text("До 5 человек в группе")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    // 5
                    HStack {
                        Image(systemName: "figure.walk")
                            .font(.title3)
                            .padding(.trailing, 4)
                            .foregroundColor(.baliGo)
                            .frame(width: 25, height: 25, alignment: .center)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Для людей со средней физической подготовкой")
                                .font(.callout)
                                .fontWeight(.medium)
                            Text("Время подъема и спуска 4-5 часов")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }

                } header: {
                    Text("Об активности")
                        .font(.callout)
                        .fontWeight(.medium)
                }


            }
            .scaledToFill()
            .listStyle(.plain)
            
        }
    }
}
