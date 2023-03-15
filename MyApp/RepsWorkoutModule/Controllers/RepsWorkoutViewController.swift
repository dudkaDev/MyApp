//
//  RepsWorkoutViewController.swift
//  MyApp
//
//  Created by Андрей Абакумов on 27.02.2023.
//

import UIKit

class RepsWorkoutViewController: UIViewController {
    
    private let startWorkoutLabel = UILabel(
        text: "START WORKOUT",
        font: .robotoMedium24(),
        textColor: .specialGray
    )
    
    private lazy var closeButton = CloseButton(type: .system)
    
    private let sportsmanImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sportsman")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let detailsView = DetailsView()
    private lazy var finishButton = GreenButton(text: "FINISH")
    
    private var workoutModel = WorkoutModel()
    private var numberOfSet = 1
    
    private let customAlert = CustomAlert()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        view.addSubview(sportsmanImageView)
        detailsView.refreshLabels(model: workoutModel, numberOfSet: numberOfSet)
        view.addSubview(detailsView)
        view.addSubview(finishButton)
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
    }
    
    private func setDelegates() {
        detailsView.cellNextSetDelegate = self
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func finishButtonTapped() {
        if numberOfSet == workoutModel.workoutSets {
            dismiss(animated: true)
            RealmManager.shared.updateStatusWorkoutModel(model: workoutModel)
        } else {
            presentAlertWithActions(title: "Warning", message: "You haven't finished your workout") {
                self.dismiss(animated: true)
            }
        }
    }
    
    public func setWorkoutModel(_ model: WorkoutModel) {
        workoutModel = model
    }
}


//MARK: - Set Constraints

extension RepsWorkoutViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            sportsmanImageView.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 10),
            sportsmanImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            sportsmanImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            sportsmanImageView.heightAnchor.constraint(equalTo: sportsmanImageView.widthAnchor, multiplier: 1),
            
            detailsView.topAnchor.constraint(equalTo: sportsmanImageView.bottomAnchor, constant: 10),
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

//MARK: - NextSetProtocol

extension RepsWorkoutViewController: NextSetProtocol {
    
    func nextSetTapped() {
        if numberOfSet < workoutModel.workoutSets {
            numberOfSet += 1
            detailsView.refreshLabels(model: workoutModel, numberOfSet: numberOfSet)
        } else {
            presentSimpleAlert(title: "Error", message: "Finish your workout")
        }
    }
    
    func editingTapped() {
        customAlert.presentCustomAlert(viewController: self, repsOrTimer: "Reps") { [weak self] sets, reps in
            guard let self = self else { return }
            if sets != "" && reps != "" {
                guard let numberOfSets = Int(sets),
                      let numberOfReps = Int(reps) else { return }
                RealmManager.shared.updateSetsRepsWorkoutModel(
                    model: self.workoutModel,
                    sets: numberOfSets,
                    reps: numberOfReps
                )
                
                self.detailsView.refreshLabels(model: self.workoutModel, numberOfSet: self.numberOfSet)
            }
        }
    }
}
