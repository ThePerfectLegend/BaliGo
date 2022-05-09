//
//  Bird Park.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 27.05.2021.
//

import Foundation

var birdPark = Landmark(
    id: 19,
    name: "Парк птиц",
    description: """
    Территория разделена на семь частей. В каждой из них воссозданы условия, приближенные к природным местам обитания пернатых. В парке живет более 1000 птиц, которые представлены 250-тью видами. Из них более 40 видов находятся под угрозой исчезновения. Часть птиц свободно перемещается по парку. Для другой части сооружены вольеры. На главной площадке посетителей встречают яркие попугаи, которые не боятся людей и умело позируют для фото. Их можно брать на руки и садить на плечо. С интервалами в 30 мин в разных частях парка проходят представления, где можно принять участие в кормлении птиц, а так же сфотографироваться. Большинство активностей проходит до полудня, поэтому приезжайте сюда с утра. Также на территории парка есть ресторан и сувенирная лавка.
    """,
    island: .Bali,
    region: .Gianyar,
    subRegion: .Sukawati,
    state: "Batubulan",
    type: "Заповедник",
    category: .Parks,
    uponCategory: .Natute,
    imagesNames: ["Bird Park 1", "Bird Park 2", "Bird Park 3", "Bird Park 4", "Bird Park 5"],
    latitude: -8.599975185971704,
    longitude: 115.25181441748285,
    internalRate: 0,
    internalSubRate: 0.94,
    activitiesOnLandmark: [13]
)
