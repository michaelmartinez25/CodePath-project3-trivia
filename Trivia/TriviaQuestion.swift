//
//  TriviaGame.swift
//  Trivia
//
//  Created by Michael Martinez on 3/10/24.
//

import Foundation
import UIKit

struct TriviaAPIResponse: Decodable {
  let questions: [TriviaQuestion]
  
  private enum CodingKeys: String, CodingKey {
    case questions = "results"
  }
}

struct TriviaQuestion: Decodable {
  let type: String
  let difficulty: String
  let category: String
  let question: String
  let correctAnswer: String
  let incorrectAnswers: [String]
  
  private enum CodingKeys: String, CodingKey {
    case type = "type"
    case difficulty = "difficulty"
    case category = "category"
    case question = "question"
    case correctAnswer = "correct_answer"
    case incorrectAnswers = "incorrect_answers"
  }
}

