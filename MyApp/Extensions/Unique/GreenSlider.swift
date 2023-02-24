//
//  GreenSlider.swift
//  MyApp
//
//  Created by Андрей Абакумов on 24.02.2023.
//

import UIKit

class GreenSlider: UISlider {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(minValue: Float, maxValue: Float) {
        self.init(frame: .zero)
        self.minimumValue = minValue
        self.maximumValue = maxValue
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        maximumTrackTintColor = .specialLightBrown
        minimumTrackTintColor = .specialGreen
        translatesAutoresizingMaskIntoConstraints = false
    }
}
