//
//  Date + Extensions.swift
//  MyApp
//
//  Created by Андрей Абакумов on 27.02.2023.
//

import Foundation

extension Date {
    
    func getWeekdayNumber() -> Int {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: self)
        return weekday
    }
}
