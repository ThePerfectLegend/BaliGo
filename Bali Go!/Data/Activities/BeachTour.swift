//
//  BeachTour.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 09.05.2022.
//

import Foundation

var beachTour = Activity(
    id: 16,
    name: "Лучшие пляжи Бали",
    type: "Экскурсия",
    numberOfReviews: 14,
    rating: 4.8,
    price: [.USD: 25, .RUB: 1618, .IDR: 360000],
    image: "temp",
    description: """
Насладиться прекрасными пейзажами южного побережья, ощутить на себе океанский бриз, "раствориться" в закате, погрузиться в атмосферу отдыха и новых впечатлений! Вы готовы? Все пляжи Бали особенные. Но мы вас непременно удивим! В течение дня вы познакомитесь с лучшими пляжами полуострова Букит, каждый из которых живописен и интересен по-своему.
""",
    milestoneContent: [
        ["Primary": "Cредняя продолжительность тура 7-8 часов",
         "Secondary": "Начало около 09:00 - 10:00 утра",
         "Image": "clock"],
        
        ["Primary": "Трансфер",
         "Secondary": "Из отеля или виллы и обратно",
         "Image": "car.fill"],
        
        ["Primary": "Билеты включены в стоимость",
         "Secondary": "Входные билеты и парковки на пляжах",
         "Image": "wallet.pass"],
        
        ["Primary": "Детям до трех лет бесплатно",
         "Secondary": "Детские билеты не предусмотрены",
         "Image": "face.smiling"]
    ],
    link: "https://mybalitrips.com/ru/beach-tour/793/?utm_pid=447",
    partner: "MyBaliTrips",
    priceOption: "За человека"
)
