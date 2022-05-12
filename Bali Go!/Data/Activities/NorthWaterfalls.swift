//
//  NorthWaterfalls.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 09.05.2022.
//

import Foundation

var northWaterfalls = Activity(
    id: 22,
    name: "Тур по водопадам водопадам севера Бали",
    type: "Экскурсия",
    numberOfReviews: 3,
    rating: 5.0,
    price: [.USD: 52, .RUB: 3800, .IDR: 750000],
    image: "NorthWaterfalls",
    description: """
Чтобы почувствовать настоящую силу Бали – отправляйтесь к водопадам, спрятанным вдали от шумных туристических районов в джунглях центральной и северной части острова. Вы окунетесь в мир дикой природы острова и попробуете себя в роли героев увлекательных приключенческих романов. Поездка к водопадам – это яркое, незабываемое приключение и встреча с новым и неизведанным! На севере острова вы увидите высокие, мощные водопады Алинг-Алинг, Гитгит и Леке Леке. Потоки воды с гулом несутся и образуют внизу небольшие лагуны. Путь к ним особенно понравится любителям острых ощущений. Смело идите навстречу удивительным природным достопримечательностям.
""",
    milestoneContent: [
        ["Primary": "Cредняя продолжительность тура около 12 часов",
         "Secondary": "Начало около 09:00 - 10:00 утра",
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
    link: "https://mybalitrips.com/ru/waterfall/968/?utm_pid=447",
    partner: "MyBaliTrips",
    priceOption: "За человека"
)
