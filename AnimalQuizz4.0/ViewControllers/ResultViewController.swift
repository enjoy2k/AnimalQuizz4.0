//
//  ResultViewController.swift
//  AnimalQuizz4.0
//
//  Created by Даниил Козлов on 29.07.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalTitleLabel: UILabel!
    @IBOutlet var animalDescriptionLabel: UILabel!
    
    var gotenAnswers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    private func updateResult() {
        
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = gotenAnswers.map { $0.animal }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
            /*               Можно и так. Только прочесть будет сложнее
             for animal in animals {
             frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
             }
             */
        
            /*        Решение в одну строку. Это читается ещё сложнее, и зависит от того кто будет работать с этим кодом.
             let mostFrequencyAnimal = Dictionary(grouping: answers) { $0.animal } .sorted { $0.value.count > $1.value.count } .firs?.key
             */
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(wirh: mostFrequencyAnimal)
    }
    
    private func updateUI(wirh animal: Animal) {
        animalTitleLabel.text = "Вы - \(animal.rawValue)!"
        animalDescriptionLabel.text = animal.definition
    }
}

