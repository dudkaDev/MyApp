//
//  StartWorkoutViewController.swift
//  MyApp
//
//  Created by Андрей Абакумов on 27.02.2023.
//

import UIKit

class StartWorkoutViewController: UIViewController {
    
    private let startWorkoutLabel = UILabel(
        text: "START WORKOUT",
        font: .robotoMedium24(),
        textColor: .specialGray
    )
    
    private lazy var closeButton = CloseButton(type: .system)
    
    private let detailsView = DetailsView()
    
    private let finishButton = GreenButton(text: "FINISH")
    
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
        
        view.addSubview(detailsView)
        view.addSubview(finishButton)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
}


//MARK: - Set Constraints

extension StartWorkoutViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            detailsView.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 100),
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
