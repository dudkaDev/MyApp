//
//  TimerWorkoutViewController.swift
//  MyApp
//
//  Created by Андрей Абакумов on 15.03.2023.
//

import UIKit

class TimerWorkoutViewController: UIViewController {
    
    private let startWorkoutLabel = UILabel(
        text: "START WORKOUT",
        font: .robotoMedium24(),
        textColor: .specialGray
    )
    
    private lazy var closeButton = CloseButton(type: .system)
    
    private let ellipseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let detailsView = DetailsView()
    private lazy var finishButton = GreenButton(text: "FINISH")
    
    private var workoutModel = WorkoutModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        view.addSubview(ellipseImageView)
        view.addSubview(detailsView)
        view.addSubview(finishButton)
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
    }
    
    private func setDelegates() {
//        detailsView.cellNextSetDelegate = self
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func finishButtonTapped() {
        print("Finish")
    }
    
    public func setWorkoutModel(_ model: WorkoutModel) {
        workoutModel = model
    }
}


//MARK: - Set Constraints

extension TimerWorkoutViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            ellipseImageView.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 10),
            ellipseImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            ellipseImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            ellipseImageView.heightAnchor.constraint(equalTo: ellipseImageView.widthAnchor, multiplier: 1),
            
            detailsView.topAnchor.constraint(equalTo: ellipseImageView.bottomAnchor, constant: 10),
            detailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            detailsView.heightAnchor.constraint(equalToConstant: 200),
            
            finishButton.topAnchor.constraint(equalTo: detailsView.bottomAnchor, constant:  20),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
