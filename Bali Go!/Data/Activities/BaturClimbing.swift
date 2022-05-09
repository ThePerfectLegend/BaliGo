//
//  temp_01.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 04.05.2022.
//

import Foundation

var climbingToBaturVolcano = Activity(
    id: 1,
    name: "Восхождение на вулкан Батур",
    type: "Трекинг",
    numberOfReviews: 102,
    rating: 4.6,
    price: [.USD : 37, .RUB : 2512, .IDR : 530000],
    image: "climbingToBatur1008",
    description: """
    Отправляйтесь встречать рассвет на вершину грозного вулкана Батур – вы увидите первозданную красоту острова Бали и наполнитесь его мощной энергией, а в мягком рассеянном свете получатся невероятные фотографии!
    """,
    milestoneContent: [
        ["Primary": "Cредняя продолжительность тура 8-10 часов",
         "Secondary": "Восхождение начнется около 4 утра",
         "Image": "clock"],
        
        ["Primary": "Трансфер",
         "Secondary": "Из отеля или виллы и обратно",
         "Image": "car.fill"],
        
        ["Primary": "Легкий завтрак",
         "Secondary": "Перед началом подъема и на вершине",
         "Image": "takeoutbag.and.cup.and.straw.fill"],
        
        ["Primary": "Подъем с гидом-проводником",
         "Secondary": "До 5 человек в группе",
         "Image": "person.2.fill"],
        
        ["Primary": "Для людей со средней физической подготовкой",
         "Secondary": "Cреднее время восхождения и спуска около 4 - 5 часов",
         "Image": "figure.walk"]
    ],
    
    link: "https://mybalitrips.com/ru/climbing-to-batur-volcano/1008/?utm_pid=447",
    partner: "MyBaliTrips",
    priceOption: "За человека"
)
