//
//  ResultViewController.swift
//  AnimalQuizz4.0
//
//  Created by Даниил Козлов on 29.07.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    //    Передать массив с ответами
    //    Определить наиболле часто встречающееся животное
    //    Отобразить результаты по этому зверю
    
    
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
    /*
     Есть массив с ответами Answer.title + .animal
         
     Создаю словарь, чтобы вынуть из ответов Животное, и присвоить ему цифу

     После этого мне нужно отсортировать словарь по количеству упоминаний животного

     А после передать в лэйбл animal.definition и animal.?
     
     
     
     
     
     
     let dictionary = ["one": 1, "three": 3, "five": 5, "two": 2, "four": 4]

     let sortedDictionary = dictionary.sorted { (firstPair, secondPair) -> Bool in
         return firstPair.key < secondPair.key
     }

     for (key, value) in sortedDictionary {
         print("\(key): \(value)")
     }
     
     
     при помощи метода updateValue() Обновляю значение в определённом ключе-животном
     Далее ты сортируешь словарь по его значению, и потом берешь первый ключ, это и будет результат.
     
     Массив нужно перебрать и в качестве ключа определить элемент массива а в качестве значения их количество, одним словом делаешь проверку если такой в словаре уже есть, то просто обновляешь значение в словаре при помощи метода updateValue
     */
