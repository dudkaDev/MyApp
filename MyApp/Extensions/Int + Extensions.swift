//
//  Int + Extensions.swift
//  MyApp
//
//  Created by Андрей Абакумов on 27.02.2023.
//

import Foundation

extension Int {
    
    func getTimeFromSeconds() -> String {
        
        if self / 60 == 0 {
            return "\(self % 60) sec"
        }
        
        if self % 60 == 0 {
            return "\(self / 60) min"
        }
        
        return "\(self / 60) min \(self % 60) sec"
    }
    
    func convertSeconds() -> (Int, Int) {
        let min = self / 60
        let sec = self % 60
        return (min, sec)
    }
    
    func setZeroForSecond() -> String {
        Double(self) / 10.0 < 1 ? "0\(self)" : "\(self)"
    }
}
