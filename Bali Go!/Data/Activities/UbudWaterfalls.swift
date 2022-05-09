//
//  UbudWaterfalls.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 09.05.2022.
//

import Foundation

var ubudWaterfalls = Activity(
    id: 21,
    name: "Водопады Убуда",
    type: "Экскурсия",
    numberOfReviews: 5,
    rating: 4.5,
    price: [.USD: 28, .RUB: 1798, .IDR: 400000],
    image: "temp",
    description: """
Чтобы почувствовать настоящую силу Бали – отправляйтесь к водопадам, спрятанным вдали от шумных туристических районов в джунглях центральной и северной части острова. Вы окунетесь в мир дикой природы острова и попробуете себя в роли героев увлекательных приключенческих романов. Поездка к водопадам – это яркое, незабываемое приключение и встреча с новым и неизведанным!
""",
    milestoneContent: [
        ["Primary": "Cредняя продолжительность тура 8-12 часов",
         "Secondary": "Начало около 08:00 - 09:00 утра",
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
    link: "https://mybalitrips.com/ru/waterfall/967/?utm_pid=447",
    partner: "MyBaliTrips",
    priceOption: "За человека"
)
