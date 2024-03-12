//
//  TriviaGame.swift
//  Trivia
//
//  Created by Michael Martinez on 3/10/24.
//

import Foundation
import UIKit

struct TriviaQuestion {
  let question: Question
  let correctAnswer: Int
}

enum Question {
  case history
  case entertainment
  case science
  
  var category: String {
    switch self {
    case .history:
      return "History"
    case .entertainment:
      return "Entertainment"
    case .science:
      return "Science"
    }
  }
  
  var prompt: String {
    switch self {
    case .history:
      return "Who was the first President of the United States?"
    case .entertainment:
      return "What was the name of Dorothy's dog in the Wizard of Oz?"
    case .science:
      return "What is the largest organ in the human body?"
    }
  }
  
  var correctAnswer: String {
    switch self {
    case .history:
      return "George Washington"
    case .entertainment:
      return "Toto"
    case .science:
      return "The skin"
    }
  }
  
  var incorrectOne: String {
    switch self {
    case .history:
      return "Abraham Lincoln"
    case .entertainment:
      return "Fido"
    case .science:
      return "The liver"
    }
  }
  
  var incorrectTwo: String {
    switch self {
    case .history:
      return "John Adams"
    case .entertainment:
      return "Scooby"
    case .science:
      return "The stomach"
    }
  }
  
  var incorrectThree: String {
    switch self {
    case .history:
      return "Alexander Hamilton"
    case .entertainment:
      return "Lassie"
    case .science:
      return "The heart"
    }
  }
  
}

