//
//  ClimbingToRinjaniVolcano.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 01.05.2022.
//

import Foundation

var paraplan = Activity(
    id: 8,
    name: "Полёт на параплане с инструктором",
    type: "Параглайдинг",
    numberOfReviews: 66,
    rating: 4.7,
    price: [.USD: 60, .RUB: 4175, .IDR: 850000],
    image: "temp",
    description: "Вы летали во сне? Тогда вы помните это чувство свободы, необыкновенной лёгкости и тишины, несравнимое ни с одним земным удовольствием. Теперь мы предлагаем вам полетать наяву - параплан на Бали!",
    milestoneContent: [
        ["Primary": "Полет на параплане с инструктором",
         "Secondary": "В зависимости от выбранной программы полет занимает 10 или 15 минут",
         "Image": "goforward.15"],
        
        ["Primary": "Съемка на GoPro",
         "Secondary": "Для передачи отснятых файлов с вашего полета необходимо 5 ГБ свободной памяти",
         "Image": "camera"],
        
        ["Primary": "Трансфер не включен в стоимость полета",
         "Secondary": "Возможен заказ трансфера от вашего отеля или виллы до точки сбора и обратно",
         "Image": "exclamationmark.circle"]

    ],
    link: "https://mybalitrips.com/ru/paraplan-na-bali/?utm_pid=447",
    partner: "MyBaliTrips",
    marketingText: "Ощути свободу контролируемого полета"
)
