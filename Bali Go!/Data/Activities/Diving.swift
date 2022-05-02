//
//  Diving.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 30.04.2022.
//

import Foundation

var diving = Activity(
    id: 4,
    name: "Дайвинг на Бали",
    type: "Дайвинг",
    numberOfReviews: 147,
    rating: 5.0,
    price: [.USD: 109, .IDR: 1638750, .RUB: 8050],
    image: "divingAmed940",
    description: "Начните свою дайвинг-историю на острове Бали. Это безопасное, увлекательное приключение. Его оценят и новички, и опытные дайверы.",
    milestoneContent: [
        ["Primary": "Несколько программы на выбор",
         "Secondary": "Подходит как новичкам, так и опытным дайверам. Возможность получения сертификата OWD",
         "Image": "arrow.triangle.branch"],
        
        ["Primary": "Погружение в сопровождении персонального подводного инструктора-гида",
         "Secondary": "Пробное занятие в бассейне и брифинг перед погружением",
         "Image": "person.2.fill"],
        
        ["Primary": "Снаряжение для дайвинга",
         "Secondary": "Предоставим все необходимое для погружения",
         "Image": "lifepreserver.fill"],
        
        ["Primary": "Легкий обед",
         "Secondary": "В перерыве между погружениями",
         "Image": "takeoutbag.and.cup.and.straw.fill"],
        
        ["Primary": "Для людей со средней физической подготовкой",
         "Secondary": "После погружения запрещены перелеты и подъем в горы",
         "Image": "figure.walk"]
    ],
    link: "https://mybalitrips.com/ru/diving/?utm_pid=447",
    partner: "MyBaliTrips",
    marketingText: "Безопасные погружения для новичков и опытных дайверов"
)
