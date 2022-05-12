//
//  RoyalPalaces.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 05.05.2022.
//

import Foundation

var royalPalaces = Activity(
    id: 11,
    name: "Королевские дворцы Бали",
    type: "Экскурсия",
    numberOfReviews: 104,
    rating: 4.8,
    price: [.USD: 61, .RUB: 4400, .IDR: 8800000],
    image: "RoyalPalaces",
    description: """
Если вы хотите почувствовать аутентичность Бали, встретить подлинных балийцев далёких от суеты западной цивилизации, познакомиться с основами культуры Хинду и узнать, зачем им столько церемоний и отчего местные жители всегда улыбаются  — отправляйтесь в путешествие по востоку Острова Богов.
""",
    milestoneContent: [
        ["Primary": "Cредняя продолжительность тура 8-10 часов",
         "Secondary": "Время проведения экскурсии с 8 утра до 6 часов вечера",
         "Image": "clock"],
        
        ["Primary": "Трансфер",
         "Secondary": "Из отеля или виллы и обратно",
         "Image": "car.fill"],
        
        ["Primary": "Входные билеты включены в стоимость",
         "Secondary": "Все билеты в храмы и дворцы",
         "Image": "wallet.pass"],
        
        ["Primary": "Детям до трех лет бесплатно",
         "Secondary": "Для детей от 3 до 12 лет приобретается детский билет",
         "Image": "face.smiling"],
        
        ["Primary": "Не рекомендуется посещение храмов женщинам в период менструального цикла",
         "Secondary": "Согласно правилам балийского индуизма",
         "Image": "exclamationmark.circle"]
    ],
    link: "https://mybalitrips.com/ru/east-tour/375/?utm_pid=447",
    partner: "MyBaliTrips",
    priceOption: "За человека",
    highPrio: true
)
