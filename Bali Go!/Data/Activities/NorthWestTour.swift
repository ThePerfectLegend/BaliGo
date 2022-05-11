//
//  NorthWestTour.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 09.05.2022.
//

import Foundation

var northWestTour = Activity(
    id: 20,
    name: "Тур: Священные жемчужины Бали",
    type: "Экскурсия",
    numberOfReviews: 44,
    rating: 4.7,
    price: [.USD: 42, .RUB: 2742, .IDR: 610000],
    image: "NorthWestTour",
    description: """
Для жителей острова Бали вера, религия и храмы имеют особое значение. В этом путешествии по Священным жемчужинам Бали мы побываем в одном из значимых для индуистских паломников мест — храме Танах Лот, расположенном на скале в океане. Далее на живописном озере Братан мы увидим Улун Дану — храм на воде с пышными садами, а после посетим любимое место всех путешественников - водопад Гит Гит. Насладитесь завораживающими видами на природу и архитектурным разнообразием вместе с нами. 
""",
    milestoneContent: [
        ["Primary": "Cредняя продолжительность тура 8-10 часов",
         "Secondary": "Начало около 08:00 - 09:00 утра",
         "Image": "clock"],
        
        ["Primary": "Трансфер",
         "Secondary": "Из отеля или виллы и обратно",
         "Image": "car.fill"],
        
        ["Primary": "Входные билеты включены в стоимость",
         "Secondary": "Все билеты в парки и храмы",
         "Image": "wallet.pass"],
        
        ["Primary": "Детям до трех лет бесплатно",
         "Secondary": "Для детей от 3 до 12 лет приобретается детский билет",
         "Image": "face.smiling"],
        
        ["Primary": "Не рекомендуется посещение храмов женщинам в период менструального цикла",
         "Secondary": "Согласно правилам балийского индуизма",
         "Image": "exclamationmark.circle"]
    ],
    link: "https://mybalitrips.com/ru/north-west-tour/374/?utm_pid=447",
    partner: "MyBaliTrips",
    priceOption: "За человека"
)
