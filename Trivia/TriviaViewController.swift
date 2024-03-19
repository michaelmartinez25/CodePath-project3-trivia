//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Michael Martinez on 3/6/24.
//

import Foundation
import UIKit

extension String {
  // A helper function to make HTML encoded text readable.
  // Provided by ChatGPT
  func decodeHTML() -> String? {
    guard let data = self.data(using: .utf8) else {
      return nil
    }
    let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
      .documentType: NSAttributedString.DocumentType.html,
      .characterEncoding: String.Encoding.utf8.rawValue
    ]
    guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
        return nil
    }
    return attributedString.string
  }
}

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
    TriviaQuestionService.fetchQuestions() {questions in
      self.triviaQuestions = questions
      self.configure(with: self.triviaQuestions[0])
    }
  }
  
  private func configure(with trivia: TriviaQuestion) {
    questionNumberLabel.text = "\(questionNumber + 1)/5"
    
    if let decodedCategory = trivia.category.decodeHTML() {
      categoryLabel.text = decodedCategory
    } else {
        print("Failed to decode HTML encoded text.")
    }
    
    if let decodedQuestion = trivia.question.decodeHTML() {
      questionLabel.text = decodedQuestion
    } else {
        print("Failed to decode HTML encoded text.")
    }
    
    if (trivia.type == "boolean") {
      // Hide answer 3 & 4 buttons, only options are True and False
      answerOneButton.setTitle("True", for: UIControl.State.normal)
      answerTwoButton.setTitle("False", for:UIControl.State.normal)
      answerThreeButton.isHidden = true
      answerFourButton.isHidden = true
    } else { // trivia type is multiple
      // Reveal all buttons, shuffle answers
      answerThreeButton.isHidden = false
      answerFourButton.isHidden = false
      
      var answers = trivia.incorrectAnswers
      answers.append(trivia.correctAnswer)
      answers.shuffle()
      
      answerOneButton.setTitle(answers[0].decodeHTML(), for:UIControl.State.normal)
      answerTwoButton.setTitle(answers[1].decodeHTML(), for:UIControl.State.normal)
      answerThreeButton.setTitle(answers[2].decodeHTML(), for:UIControl.State.normal)
      answerFourButton.setTitle(answers[3].decodeHTML(), for:UIControl.State.normal)
    }
  }
  
  private func resetGame() {
    let alert = UIAlertController(title: "Game Over!", message: "Final Score \(numberCorrect)/5", preferredStyle: .alert)
    let restartAction = UIAlertAction(title: NSLocalizedString("Restart", comment: "Default action"), style: .default) { _ in
      self.questionNumber = 0
      self.numberCorrect = 0
      TriviaQuestionService.fetchQuestions() {questions in
        self.triviaQuestions = questions
        self.configure(with: self.triviaQuestions[0])
      }
    }
    alert.addAction(restartAction)
    self.present(alert, animated: true, completion: nil)
  }

  @IBAction func didTapAnswerOneButton(_ sender: UIButton) {
    if (answerOneButton.titleLabel!.text == triviaQuestions[questionNumber].correctAnswer.decodeHTML()) {
      numberCorrect += 1
    }
    
    if (questionNumber == triviaQuestions.count - 1) {
      resetGame()
    } else { // move on to next question
      questionNumber = min(triviaQuestions.count - 1, questionNumber + 1)
      configure(with: triviaQuestions[questionNumber])
    }
  }
  
  @IBAction func didTapAnswerTwoButton(_ sender: UIButton) {
    if (answerTwoButton.titleLabel!.text == triviaQuestions[questionNumber].correctAnswer.decodeHTML()) {
      numberCorrect += 1
    }
    
    if (questionNumber == triviaQuestions.count - 1) {
      resetGame()
    } else {
      questionNumber = min(triviaQuestions.count - 1, questionNumber + 1)
      configure(with: triviaQuestions[questionNumber])
    }
  }
  
  @IBAction func didTapAnswerThreeButton(_ sender: UIButton) {
    if (answerThreeButton.titleLabel!.text == triviaQuestions[questionNumber].correctAnswer.decodeHTML()) {
      numberCorrect += 1
    }
    
    if (questionNumber == triviaQuestions.count - 1) {
      resetGame()
    } else {
      questionNumber = min(triviaQuestions.count - 1, questionNumber + 1)
      configure(with: triviaQuestions[questionNumber])
    }
  }
  
  @IBAction func didTapAnswerFourButton(_ sender: UIButton) {
    if (answerFourButton.titleLabel!.text == triviaQuestions[questionNumber].correctAnswer.decodeHTML()) {
      numberCorrect += 1
    }
    
    if (questionNumber == triviaQuestions.count - 1) {
      resetGame()
    } else {
      questionNumber = min(triviaQuestions.count - 1, questionNumber + 1)
      configure(with: triviaQuestions[questionNumber])
    }
  }
}
