//
//  Snorkeling.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 01.05.2022.
//

import Foundation

var snorkeling = Activity(
    id: 5,
    name: "Снорклинг на Бали",
    type: "Снорклинг",
    numberOfReviews: 169,
    rating: 4.7,
    price: [.USD: 39, .IDR: 570000, .RUB: 2800],
    image: "temp",
    description: """
Хотите испытать яркие эмоции – отправляйтесь исследовать подводный мир побережья Бали и соседних островов. Приезжайте вместе с детьми и плавайте с маской и трубкой, рассматривая яркие кораллы, маленьких разноцветных рыб и мурен. Если повезет – встретитесь с гигансткими скатами и огромными морскими черепахами.
""",
    milestoneContent: [
        ["Primary": "Несколько программы на выбор",
         "Secondary": "Снорклинг у побережья островов Бали, Hуса Лембонган или Hуса Пенида",
         "Image": "arrow.triangle.branch"],
        
        ["Primary": "Снаряжение для снорклинга",
         "Secondary": "Маска и ласты",
         "Image": "lifepreserver.fill"],
        
        ["Primary": "Обед",
         "Secondary": "Индонезийская кухня",
         "Image": "takeoutbag.and.cup.and.straw.fill"]

    ],
    link: "https://mybalitrips.com/ru/snorkeling/?utm_pid=447",
    partner: "MeBaliTrips",
    marketingText: "Восхитительный мир океана, буйство красок, гигантские морские скаты и черепахи"
)




