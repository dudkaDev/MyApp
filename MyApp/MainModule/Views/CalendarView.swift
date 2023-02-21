//
//  CalendarView.swift
//  MyApp
//
//  Created by Андрей Абакумов on 21.02.2023.
//

import UIKit

class CalendarView: UIView {
    
    override init(frame: CGRect) {              //обязательный инициализатор погуглить
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.2421928048, green: 0.6150656343, blue: 0.5633327961, alpha: 1)
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension CalendarView {
    
    private func setConstraints() {
        
    }
}
