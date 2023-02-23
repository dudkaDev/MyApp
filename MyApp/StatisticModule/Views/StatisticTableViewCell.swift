//
//  StatisticTableViewCell.swift
//  MyApp
//
//  Created by Андрей Абакумов on 22.02.2023.
//

import UIKit

class StatisticTableViewCell: UITableViewCell {
    
    private let exercisesNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Biceps"
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let progressCountLabel: UILabel = {
        let label = UILabel()
        label.text = "+2"
        label.textColor = .specialGreen
        label.font = .robotoMedium24()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let beforeRepsLabel = UILabel(text: "Before: 18")
    private let nowRepsLabel = UILabel(text: "Now: 20")
    
    var labelsStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialBackground
        
        addSubview(exercisesNameLabel)
        addSubview(beforeRepsLabel)
        addSubview(nowRepsLabel)
        addSubview(progressCountLabel)
        
        labelsStackView = UIStackView(
            arrangedSubviews: [beforeRepsLabel, nowRepsLabel],
            axis: .horizontal,
            spacing: 10
        )
        addSubview(labelsStackView)
        addSubview(lineView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            exercisesNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            exercisesNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            exercisesNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            progressCountLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            progressCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            progressCountLabel.widthAnchor.constraint(equalToConstant: 50),

            labelsStackView.topAnchor.constraint(equalTo: exercisesNameLabel.bottomAnchor, constant: 0),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
