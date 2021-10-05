//
//  DetailingWeatherModel.swift
//  TestApp
//
//  Created by Kiryusha Orlov on 05.10.2021.
//

import Foundation

class DetailingWeatherModel {
    
    var cities: [Int:String] = [
                524894: "Moscow",
                5056033: "London",
                7778677: "Dublin",
                5039192: "New York",
                1850147: "Tokyo"]
    let citiesId: Int
    let city: String
    let temp: Double
    
    init(citiesId: Int, temp: Double) {
        
        self.citiesId = citiesId
        self.temp = temp
        self.city = cities[citiesId] ?? "Unknown"
        
    }
    
}
