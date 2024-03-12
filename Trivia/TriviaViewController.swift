//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Michael Martinez on 3/6/24.
//

import UIKit

class TriviaViewController: UIViewController {
  @IBOutlet weak var questionNumberLabel: UILabel!
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var answerOneButton: UIButton!
  @IBOutlet weak var answerTwoButton: UIButton!
  @IBOutlet weak var answerThreeButton: UIButton!
  @IBOutlet weak var answerFourButton: UIButton!
  
  private var triviaQuestions = [TriviaQuestion]()
  private var questionNumber = 0
  private var numberCorrect = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    triviaQuestions = createMockQuestions()
    configure(with: triviaQuestions[questionNumber])
        
  }
    
  private func createMockQuestions() -> [TriviaQuestion] {
    var correctAnswerIndex = Int.random(in: 1...4)
    let historyQuestion = TriviaQuestion(question: .history,
                                         correctAnswer: correctAnswerIndex)
    correctAnswerIndex = Int.random(in: 1...4)
    let entertainmentQuestion = TriviaQuestion(question: .entertainment,
                                         correctAnswer: correctAnswerIndex)
    correctAnswerIndex = Int.random(in: 1...4)
    let scienceQuestion = TriviaQuestion(question: .science,
                                         correctAnswer: correctAnswerIndex)
    
    return [historyQuestion, entertainmentQuestion, scienceQuestion]
  }
  
  private func configure(with trivia: TriviaQuestion) {
    questionNumberLabel.text = "\(questionNumber + 1)/3"
    categoryLabel.text = trivia.question.category
    questionLabel.text = trivia.question.prompt
    
    if (trivia.correctAnswer == 1) {
      answerOneButton.setTitle(trivia.question.correctAnswer, for: UIControl.State.normal)
      answerTwoButton.setTitle(trivia.question.incorrectOne, for: UIControl.State.normal)
      answerThreeButton.setTitle(trivia.question.incorrectTwo, for: UIControl.State.normal)
      answerFourButton.setTitle(trivia.question.incorrectThree, for: UIControl.State.normal)
    } else if (trivia.correctAnswer == 2) {
      answerOneButton.setTitle(trivia.question.incorrectOne, for: UIControl.State.normal)
      answerTwoButton.setTitle(trivia.question.correctAnswer, for: UIControl.State.normal)
      answerThreeButton.setTitle(trivia.question.incorrectTwo, for: UIControl.State.normal)
      answerFourButton.setTitle(trivia.question.incorrectThree, for: UIControl.State.normal)
    } else if (trivia.correctAnswer == 3) {
      answerOneButton.setTitle(trivia.question.incorrectOne, for: UIControl.State.normal)
      answerTwoButton.setTitle(trivia.question.incorrectTwo, for: UIControl.State.normal)
      answerThreeButton.setTitle(trivia.question.correctAnswer, for: UIControl.State.normal)
      answerFourButton.setTitle(trivia.question.incorrectThree, for: UIControl.State.normal)
    } else if (trivia.correctAnswer == 4) {
      answerOneButton.setTitle(trivia.question.incorrectOne, for: UIControl.State.normal)
      answerTwoButton.setTitle(trivia.question.incorrectTwo, for: UIControl.State.normal)
      answerThreeButton.setTitle(trivia.question.incorrectThree, for: UIControl.State.normal)
      answerFourButton.setTitle(trivia.question.correctAnswer, for: UIControl.State.normal)
    }
  }
  
  private func resetGame() {
    questionNumber = 0
    numberCorrect = 0
    triviaQuestions = createMockQuestions()
    configure(with: triviaQuestions[questionNumber])
  }

  @IBAction func didTapAnswerOneButton(_ sender: UIButton) {
    if (triviaQuestions[questionNumber].correctAnswer == 1) {
      numberCorrect += 1
    }
    
    if (questionNumber == triviaQuestions.count - 1) {
      let alert = UIAlertController(title: "Game Over!", message: "Final Score \(numberCorrect)/3", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: NSLocalizedString("Restart", comment: "Default action"), style: .default))
      self.present(alert, animated: true, completion: nil)
      resetGame()
    } else { // move on to next question
      questionNumber = min(triviaQuestions.count - 1, questionNumber + 1)
      configure(with: triviaQuestions[questionNumber])
    }
  }
  
  @IBAction func didTapAnswerTwoButton(_ sender: UIButton) {
    if (triviaQuestions[questionNumber].correctAnswer == 2) {
      numberCorrect += 1
    }
    
    if (questionNumber == triviaQuestions.count - 1) {
      let alert = UIAlertController(title: "Game Over!", message: "Final Score \(numberCorrect)/3", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: NSLocalizedString("Restart", comment: "Default action"), style: .default))
      self.present(alert, animated: true, completion: nil)
      resetGame()
    } else {
      questionNumber = min(triviaQuestions.count - 1, questionNumber + 1)
      configure(with: triviaQuestions[questionNumber])
    }
  }
  
  @IBAction func didTapAnswerThreeButton(_ sender: UIButton) {
    if (triviaQuestions[questionNumber].correctAnswer == 3) {
      numberCorrect += 1
    }
    
    if (questionNumber == triviaQuestions.count - 1) {
      let alert = UIAlertController(title: "Game Over!", message: "Final Score \(numberCorrect)/3", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: NSLocalizedString("Restart", comment: "Default action"), style: .default))
      self.present(alert, animated: true, completion: nil)
      resetGame()
    } else {
      questionNumber = min(triviaQuestions.count - 1, questionNumber + 1)
      configure(with: triviaQuestions[questionNumber])
    }
  }
  
  @IBAction func didTapAnswerFourButton(_ sender: UIButton) {
    if (triviaQuestions[questionNumber].correctAnswer == 4) {
      numberCorrect += 1
    }
    
    if (questionNumber == triviaQuestions.count - 1) {
      let alert = UIAlertController(title: "Game Over!", message: "Final Score \(numberCorrect)/3", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: NSLocalizedString("Restart", comment: "Default action"), style: .default))
      self.present(alert, animated: true, completion: nil)
      resetGame()
    } else {
      questionNumber = min(triviaQuestions.count - 1, questionNumber + 1)
      configure(with: triviaQuestions[questionNumber])
    }
  }
}
