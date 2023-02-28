//
//  DetailsView.swift
//  MyApp
//
//  Created by Андрей Абакумов on 27.02.2023.
//

import UIKit

class DetailsView: UIView {
    
    private let detailsLabel = UILabel(text: "Details")
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let exerciseNameLabel = UILabel(
        text: "Biceps",
        font: .robotoMedium18(),
        textColor: .specialGray
    )
    
    private let setsLabel = UILabel(
        text: "Sets",
        font: .robotoMedium18(),
        textColor: .specialGray
    )
    
    private let setsNumberLabel = UILabel(
        text: "1/4",
        font: .robotoMedium18(),
        textColor: .specialGray
    )
    
    private let repsLabel = UILabel(
        text: "Reps",
        font: .robotoMedium18(),
        textColor: .specialGray
    )
    
    private let repsNumberLabel = UILabel(
        text: "20",
        font: .robotoMedium18(),
        textColor: .specialGray
    )
    
    private let editingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Editing", for: .normal)
        button.tintColor = .specialBlack
        button.titleLabel?.font = .robotoMedium14()
        button.layer.cornerRadius = 10
        button.backgroundColor = .none
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextSetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT SET", for: .normal)
        button.tintColor = .specialGray
        button.titleLabel?.font = .robotoBold16()
        button.layer.cornerRadius = 10
        button.backgroundColor = .specialDarkYellow
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var setsStackView = UIStackView()
    var repsStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(detailsLabel)
        addSubview(backView)
        
        addSubview(exerciseNameLabel)
        setsStackView = UIStackView(
            arrangedSubviews: [setsLabel, setsNumberLabel],
            axis: .horizontal,
            spacing: 10
        )
        backView.addSubview(setsStackView)
        
        repsStackView = UIStackView(
            arrangedSubviews: [repsLabel, repsNumberLabel],
            axis: .horizontal,
            spacing: 10
        )
        repsStackView.distribution = .equalSpacing
        backView.addSubview(repsStackView)
        
        backView.addSubview(editingButton)
        backView.addSubview(nextSetButton)
    }
}

//MARK: - Set Constraints

extension DetailsView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            detailsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            detailsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            
            backView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 3),
            backView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            exerciseNameLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            exerciseNameLabel.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            
            setsStackView.topAnchor.constraint(equalTo: exerciseNameLabel.topAnchor, constant: 20),
            setsStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            setsStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),

            repsStackView.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 20),
            repsStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            repsStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            
            editingButton.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 5),
            editingButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            
            nextSetButton.topAnchor.constraint(equalTo: editingButton.bottomAnchor, constant: 5),
            nextSetButton.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            nextSetButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            nextSetButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

