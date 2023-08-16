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
        navigationItem.setHidesBackButton(true, animated: true)
        
        
        if let totSmiyZver = mostFrequentAnimal(in: gotenAnswers) {
            animalTitleLabel.text = "Вы - \(totSmiyZver.rawValue)"
            animalDescriptionLabel.text = totSmiyZver.definition
        }
    }
    
    private func mostFrequentAnimal(in answers: [Answer]) -> Animal? {
        var slovarSOtvetami: [Animal : Int] = [:]
        
        for animal in gotenAnswers {
            slovarSOtvetami[animal.animal, default: 0] += 1
        }
        
        var mostFrequentAnimal: Animal?
        var highestCount = 0
        
        for (animal, count) in slovarSOtvetami {
            if count > highestCount {
                mostFrequentAnimal = animal
                highestCount = count
            }
        }
        return mostFrequentAnimal
    }
}
