//
//  TicketsToGili.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 22.04.2022.
//

import Foundation

var ticketsToGili = Activity(
    id: 2,
    name: "Билеты на острова Гили",
    type: "Трансфер",
    numberOfReviews: 22,
    rating: 4.9,
    price: [.USD: 48, .RUB: 3317, .IDR: 700000],
    image: "temp",
    description: """
    Белые песчаные пляжи, бирюзовое море, красочные коралловые рифы и снорклинг с гигантскими морскими черепахами - это всё острова Гили. Чтобы добраться к местам безмятежности и спокойствия, предлагаем вам билеты на комфортабельные скоростные лодки до островов Гили Траванган, Гили Эйр или Гили Мено.
""",
    milestoneContent: [
        ["Primary": "Путь до островов Гили займет 2.5 часа",
         "Secondary": "Отправление ежедневно из порта Паданг Бай в 09:30",
         "Image": "clock"],
        
        ["Primary": "Скоростной катер с удобствами",
         "Secondary": "Кондиционер, удобные кресла и медиаразвлечения",
         "Image": "ferry.fill"],

        ["Primary": "Комфортно для путешествий с детьми и большим количеством багажа",
         "Secondary": "Детям до 3 лет билет не требуется",
         "Image": "face.smiling"]
    ],
    link: "https://mybalitrips.com/ru/tickets-to-gili-islands/1523/?utm_pid=447",
    partner: "MyBaliTrips",
    priceOption: "Туда и обратно",
    highPrio: true
)
