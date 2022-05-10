//
//  TicketsToNusaPenida.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 05.05.2022.
//

import Foundation

var ticketsToNusaPenida = Activity(
    id: 10,
    name: "Билеты на остров Нуса Пенида",
    type: "Трансфер",
    numberOfReviews: 92,
    rating: 4.8,
    price: [.USD: 21, .RUB: 1379, .IDR: 300000],
    image: "TicketsToNusaPenida",
    description: """
Живописный остров Нуса Пенида - это прекрасная возможность провести отличные выходные вдалеке от шумного Бали и исследовать ещё один индонезийский остров. Мы предлагаем самый быстрый и удобный способ добраться до острова Нуса Пенида — скоростной катер.
""",
    milestoneContent: [
        ["Primary": "Путь до острова Нуса Пенида займет около часа",
         "Secondary": "Отправление ежедневно из порта Санур в 07:30, 09:00 и 15:00",
         "Image": "clock"],

        ["Primary": "Детям до трех лет бесплатно",
         "Secondary": "Для детей от 3 до 12 лет приобретается детский билет",
         "Image": "face.smiling"],
    ],
    link: "https://mybalitrips.com/ru/bilety-na-nusa-penida/365/?utm_pid=447",
    partner: "MyBaliTrips",
    priceOption: "Туда и обратно",
    highPrio: true
)
