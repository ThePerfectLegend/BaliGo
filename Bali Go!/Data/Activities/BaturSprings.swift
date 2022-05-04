//
//  temp_02.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 04.05.2022.
//

import Foundation

var climbingToBaturVolcanoSprings = Activity(
    id: 9,
    name: "Восхождение на Батур с посещением горячих источников",
    type: "Трекинг",
    numberOfReviews: 202,
    rating: 4.7,
    price: [.USD: 51, .IDR: 730000, .RUB: 3460],
    image: "temp",
    description: """
Отправляйтесь встречать незабываемый рассвет на вершину грозного вулкана Батур – вы увидите первозданную красоту острова Бали и наполнитесь его мощной энергией, а после расслабьтесь в горячих источниках с роскошным видом на озеро и горы.
""",
    milestoneContent: [
        ["Primary": "Среднее время тура 10 - 12 часов",
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
        
        ["Primary": "Входные билеты включены в стоимость",
         "Secondary": "На горячие источники",
         "Image": "wallet.pass"],
        
        ["Primary": "Для людей со средней физической подготовкой",
         "Secondary": "Cреднее время восхождения и спуска около 4 - 5 часов",
         "Image": "figure.walk"]
    ],
    
    link: "https://mybalitrips.com/ru/climbing-to-batur-volcano/1009/?utm_pid=447",
    partner: "MyBaliTrips",
    marketingText: "Покорите грозный Батур, а после расслабьтесь в горячих источниках"
)
