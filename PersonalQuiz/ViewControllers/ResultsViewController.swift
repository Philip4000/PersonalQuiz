//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answersChoosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        setupUI()
        
    }
    
    private func setupUI() {
        
        let animals = answersChoosen.map { $0.type }
        var choosenAnimals: [AnimalType : Int] = [:]
        
        for animal in animals {
            if let animalTypeCount = choosenAnimals[animal] {
                choosenAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                choosenAnimals[animal] = 1
            }
        }
        
        let sortedChoosenAnimals = choosenAnimals.sorted { $0.value > $1.value }
        let winnerAnimal = sortedChoosenAnimals.first?.key
        
        getText(animalType: winnerAnimal ?? .dog)
        
    }
    
    private func getText(animalType: AnimalType) {
        mainLabel.text = "Вы - \(animalType.rawValue)"
        descriptionLabel.text = animalType.definition
    }
    
}



