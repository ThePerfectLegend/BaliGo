//
//  NorthWaterfalls.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 09.05.2022.
//

import Foundation

var northWaterfalls = Activity(
    id: 22,
    name: "Водопады севера",
    type: "Экскурсия",
    numberOfReviews: 3,
    rating: 5.0,
    price: [.USD: 35, .RUB: 2248, .IDR: 500000],
    image: "NorthWaterfalls",
    description: """

""",
    milestoneContent: [
        ["Primary": "Cредняя продолжительность тура около 12 часов",
         "Secondary": "Начало около 09:00 - 10:00 утра",
         "Image": "clock"],
        
        ["Primary": "Трансфер",
         "Secondary": "Из отеля или виллы и обратно",
         "Image": "car.fill"],
        
        ["Primary": "Входные билеты включены в стоимость",
         "Secondary": "Все билеты на водопады",
         "Image": "wallet.pass"],
        
        ["Primary": "Детям до трех лет бесплатно",
         "Secondary": "Для детей от 3 до 12 лет приобретается детский билет",
         "Image": "face.smiling"]
    ],
    link: "https://mybalitrips.com/ru/waterfall/968/?utm_pid=447",
    partner: "MyBaliTrips",
    priceOption: "За человека"
)
