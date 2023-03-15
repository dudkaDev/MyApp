//
//  DetailsView.swift
//  MyApp
//
//  Created by Андрей Абакумов on 27.02.2023.
//

import UIKit

protocol NextSetProtocol: AnyObject {
    func nextSetTapped()
    func editingTapped()
}

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
        font: .robotoMedium24(),
        textColor: .specialGray
    )
    
    private let setsLabel = UILabel(
        text: "Sets",
        font: .robotoMedium18(),
        textColor: .specialGray
    )
    
    private let setsNumberLabel = UILabel(
        text: "1/4",
        font: .robotoMedium24(),
        textColor: .specialGray
    )
    
    private let setsLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let repsLabel = UILabel(
        text: "Reps",
        font: .robotoMedium18(),
        textColor: .specialGray
    )
    
    private let repsNumberLabel = UILabel(
        text: "20",
        font: .robotoMedium24(),
        textColor: .specialGray
    )
    
    private let repsLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var editingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "editing")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("Editing", for: .normal)
        button.tintColor = .specialLightBrown
        button.titleLabel?.font = .robotoMedium16()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(editingButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextSetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT SET", for: .normal)
        button.tintColor = .specialGray
        button.titleLabel?.font = .robotoBold16()
        button.layer.cornerRadius = 10
        button.backgroundColor = .specialYellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextSetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var setsStackView = UIStackView()
    var repsStackView = UIStackView()
    
    weak var cellNextSetDelegate: NextSetProtocol?
    
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
        backView.addSubview(setsLineView)
        
        repsStackView = UIStackView(
            arrangedSubviews: [repsLabel, repsNumberLabel],
            axis: .horizontal,
            spacing: 10
        )
        repsStackView.distribution = .equalSpacing
        backView.addSubview(repsStackView)
        backView.addSubview(repsLineView)
        
        backView.addSubview(editingButton)
        backView.addSubview(nextSetButton)
    }
    
    @objc func editingButtonTapped() {
        cellNextSetDelegate?.editingTapped()
    }
    
    @objc func nextSetButtonTapped() {
        cellNextSetDelegate?.nextSetTapped()
    }
    
    public func refreshLabels(model: WorkoutModel, numberOfSet: Int) {
        exerciseNameLabel.text = model.workoutName
        setsNumberLabel.text = "\(numberOfSet)/\(model.workoutSets)"
        repsNumberLabel.text = "\(model.workoutReps)"
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
            backView.bottomAnchor.constraint(equalTo: nextSetButton.bottomAnchor, constant: 10),
            
            exerciseNameLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            exerciseNameLabel.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            
            setsStackView.topAnchor.constraint(equalTo: exerciseNameLabel.topAnchor, constant: 20),
            setsStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            setsStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            
            setsLineView.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 0),
            setsLineView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            setsLineView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            setsLineView.heightAnchor.constraint(equalToConstant: 1),
            
            repsStackView.topAnchor.constraint(equalTo: setsLineView.bottomAnchor, constant: 20),
            repsStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            repsStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            
            repsLineView.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 0),
            repsLineView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            repsLineView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            repsLineView.heightAnchor.constraint(equalToConstant: 1),
            
            editingButton.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 5),
            editingButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            
            nextSetButton.topAnchor.constraint(equalTo: editingButton.bottomAnchor, constant: 5),
            nextSetButton.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            nextSetButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -15),
            nextSetButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

