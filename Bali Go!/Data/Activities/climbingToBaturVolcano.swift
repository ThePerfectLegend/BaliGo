//
//  Activity.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 17.04.2022.
//

import Foundation

var climbingToBaturVolcano = Activity(
    id: 1,
    name: "Восхождение на вулкан Батур",
    type: "Трекинг",
    numberOfReviews: 425,
    rating: 4.7,
    price: [.USD : 37, .RUB : 2979, .IDR : 530000],
    image: "climbingToBatur1008",
    description: """
    Отправляйтесь встречать рассвет на вершину грозного вулкана Батур – вы увидите первозданную красоту острова Бали и наполнитесь его мощной энергией, а в мягком рассеянном свете получаются невероятные фотографии!
    """,
    milestoneContent: [
        ["Primary": "Длительность 8 часов",
         "Secondary": "Восхождение начнется около 4 утра",
         "Image": "clock"],
        
        ["Primary": "Трансфер включен",
         "Secondary": "Из отеля или виллы и обратно",
         "Image": "car.fill"],
        
        ["Primary": "Легкий завтрак",
         "Secondary": "Перед началом подъема и на вершине",
         "Image": "cup.and.saucer.fill"],
        
        ["Primary": "Подъем с гидом-проводником",
         "Secondary": "До 5 человек в группе",
         "Image": "person.2.fill"],
        
        ["Primary": "Для людей со средней физической подготовкой",
         "Secondary": "Время подъема и спуска 4-5 часов",
         "Image": "figure.walk"]
    ],
    
    link: "https://mybalitrips.com/ru/climbing-to-batur-volcano/?utm_pid=447",
    partner: "MyBaliTrips",
    marketingText: "Треккинг на высоту 1717 метров и незабываемые пейзажи"
)
