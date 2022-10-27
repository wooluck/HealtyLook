//
//  WeatherModel.swift
//  HealthyLook
//
//  Created by luck woo on 2022/10/27.
//

import Foundation

struct WeatherModel: Codable {
    let weather: [Weather]
    let main: Main
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
   
