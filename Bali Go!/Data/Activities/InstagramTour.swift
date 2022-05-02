//
//  InstagramTour.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 30.04.2022.
//

import Foundation

var instagramTour = Activity(
    id: 3,
    name: "Инстаграм тур",
    type: "Экскурсия",
    numberOfReviews: 215,
    rating: 4.9,
    price: [.USD: 48, .IDR: 700000, .RUB: 3439],
    image: "instagramTour693",
    description: """
Хотите сделать фотографии в самых топовых местах острова Бали? Для вас и ваших близких мы организуем однодневное путешествие по популярным местам в районе Убуда: рисовые террасы, качели в джунглях, водопады и многое другое для того, чтобы вы сделали свои лучшие кадры и узнали больше об острове.
""",
    milestoneContent: [
        ["Primary": "Среднее время тура 7-8 часов",
         "Secondary": "Начало около 07:00 - 08:00 утра",
         "Image": "clock"],
        
        ["Primary": "Трансфер",
         "Secondary": "Из отеля или виллы и обратно",
         "Image": "car.fill"],
        
        ["Primary": "Входные билеты включены в стоимость",
         "Secondary": "Все билеты в парки и храмы",
         "Image": "wallet.pass"],
        
        ["Primary": "Меню азиатской кухнию на обед",
         "Secondary": "Возьмите с собой легкий перекус на время тура",
         "Image": "fork.knife"],
        
        ["Primary": "Детям до трех лет бесплатно",
         "Secondary": "Детский билет от 3-х до 12 лет",
         "Image": "face.smiling"],
        
        ["Primary": "Не рекомендуется посещение храмов женщинам в период менструального цикла",
         "Secondary": "Согласно правилам балийского индуизма",
         "Image": "exclamationmark.circle"]
    ],
    link: "https://mybalitrips.com/ru/instagram-tour/?utm_pid=447",
    partner: "MyBaliTrips",
    marketingText: "Качели в джунглях, водопады, традиционные храмы, лес обезьян и рисовые террасы"
)
