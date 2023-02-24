//
//  CalendarView.swift
//  MyApp
//
//  Created by Андрей Абакумов on 21.02.2023.
//

import UIKit

class CalendarView: UIView {
    
    private let idCalendarCell = "idCalendarCell"
    
    private let collectionView = CalendarCollectionView()
    
    override init(frame: CGRect) {              //обязательный инициализатор погуглить
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
    }
}

//MARK: - Set Constraints

extension CalendarView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
