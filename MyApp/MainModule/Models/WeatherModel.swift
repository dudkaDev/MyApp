//
//  WeatherModel.swift
//  MyApp
//
//  Created by Андрей Абакумов on 05.04.2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherInfo = try? JSONDecoder().decode(WeatherInfo.self, from: jsonData)

import Foundation

// MARK: - WeatherInfo
struct WeatherModel: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
}

// MARK: - Main
struct Main: Decodable {
    let temp, tempMin, tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
    var temperatureCelsius: Int {
        Int(temp - 273.15)
    }
}

// MARK: - Weather
struct Weather: Decodable {
    let description, icon: String
    
    var myDescription: String {
        switch description {
        case "clear sky": return "Ясно"
        case "few clouds": return "Облачно"
        case "broken clouds": return "Облачно"
        case "snow": return "Снег"
        case "rain": return "Дождь"
        default: return "No data"
        }
    }
}
