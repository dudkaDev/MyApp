//
//  GreenButton.swift
//  MyApp
//
//  Created by Андрей Абакумов on 24.02.2023.
//

import UIKit

class GreenButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(text: String) {
        self.init(type: .system)
        self.setTitle(text, for: .normal)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tintColor = .white
        titleLabel?.font = .robotoBold16()
        layer.cornerRadius = 10
        backgroundColor = .specialGreen
        translatesAutoresizingMaskIntoConstraints = false
    }
}
