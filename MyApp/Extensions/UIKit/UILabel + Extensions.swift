//
//  UILabel + Extensions.swift
//  MyApp
//
//  Created by Андрей Абакумов on 23.02.2023.
//

import UIKit

extension UILabel {
    convenience init(text: String = "") {
        self.init()
        self.text = text
        self.font = .robotoMedium14()
        self.textColor = .specialLightBrown
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(text: String = "", font:UIFont?, textColor:UIColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
