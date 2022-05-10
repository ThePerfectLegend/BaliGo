//
//  UluwatuKecak.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 09.05.2022.
//

import Foundation

var uluwatuKecak = Activity(
    id: 17,
    name: "Улувату тур",
    type: "Экскурсия",
    numberOfReviews: 4,
    rating: 4.7,
    price: [.USD: 25, .RUB: 1618, .IDR: 360000],
    image: "UluwatuKecak",
    description: """
Желаете окунуться в мистический мир балийских традиций и увидеть древний огненный танец Кечак? Мы создали программу тура, которая позволит вам ощутить энергию природы,  значимость традиций и религии для местных жителей. Наша поездка будет проходить по южной части острова полной живописных пляжей. Вы сможете искупаться, провести время под лучами солнца и сделать незабываемые фотографии!
""",
    milestoneContent: [
        ["Primary": "Cредняя продолжительность тура 7-8 часов",
         "Secondary": "Начало около 12:00 - 13:00 утра",
         "Image": "clock"],
        
        ["Primary": "Трансфер",
         "Secondary": "Из отеля или виллы и обратно",
         "Image": "car.fill"],
        
        ["Primary": "Билеты включены в стоимость",
         "Secondary": "Входные билеты в храм и парковки на пляжах",
         "Image": "wallet.pass"],
        
        ["Primary": "Детям до трех лет бесплатно",
         "Secondary": "Детские билеты не предусмотрены",
         "Image": "face.smiling"],
        
        ["Primary": "Не рекомендуется посещение храма женщинам в период менструального цикла",
         "Secondary": "Согласно правилам балийского индуизма",
         "Image": "exclamationmark.circle"]
    ],
    link: "https://mybalitrips.com/ru/uluwatu-kecak/797/?utm_pid=447",
    partner: "MyBaliTrips",
    priceOption: "За человека"
)
