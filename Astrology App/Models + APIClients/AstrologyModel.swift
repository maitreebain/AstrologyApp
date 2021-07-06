//
//  ZodiacModel.swift
//  Astrology App
//
//  Created by Maitree Bain on 7/6/21.
//

import Foundation

struct AstrologyModel: Decodable {
    let sunsign: String
    let date: String
    let horoscope: String
    let meta: Meta
}

struct Meta: Decodable {
    let mood: String
    let keywords:String
    let intensity: String
}
