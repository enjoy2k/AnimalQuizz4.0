//
//  QuestionViewController.swift
//  AnimalQuizz4.0
//
//  Created by Даниил Козлов on 29.07.2023.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionProgressView: UIProgressView!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    
    private let questions = Question.getQuestions()
    private var answersChosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    private var questionIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[buttonIndex]
        answersChosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed(_ sender: Any) {
    }
    
    @IBAction func rangedAnswerButtonPressed(_ sender: Any) {
    }
    
}

// MARK: - Private Methods
extension QuestionsViewController {
    private func updateUI() {
//        Скрыть все стэки
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
//        Получение текущего вопроса из массива по индексу
        let currentQuestion = questions[questionIndex]
        
//        Установка текущего вопроса для лэйбла
        questionLabel.text = currentQuestion.title
        
//        Отображаю текущий прогресс
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
//        Установка прогресса для прогрессВью
        questionProgressView.setProgress(totalProgress, animated: true)
        
//        Установка номера вопроса в навиТайтл
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
//        Отобразить текущие ответы
        showCurrentAnswers(for: currentQuestion.type)
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single: showSingleStackView(with: currentAnswers)
        case .multiple: break
        case .ranged: break
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden.toggle()
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
    private func
}

// Остановился на 1.52.20
