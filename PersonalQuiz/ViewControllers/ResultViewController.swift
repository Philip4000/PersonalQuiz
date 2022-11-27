//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupUI()

    }
 
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }

    private func setupUI() {
        let winner = winnerDetermination()
        
        mainLabel.text = "Вы - \(winner.rawValue)"
        descriptionLabel.text = winner.definition
        
    }
    
    private func winnerDetermination() -> AnimalType {
        let groupAnswersByType = Dictionary(grouping: answers) { $0.type }
        let sortedAnswers = groupAnswersByType.sorted { $0.value.count > $1.value.count}
        let winnerType = sortedAnswers.first?.key ?? .dog
        
        return winnerType
    }
    
}
