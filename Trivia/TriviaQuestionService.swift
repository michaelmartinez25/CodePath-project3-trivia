//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Michael Martinez on 3/14/24.
//

import Foundation

class TriviaQuestionService {
  static func fetchQuestions(completion: (([TriviaQuestion]) -> Void)? = nil) {
    let url = URL(string: "https://opentdb.com/api.php?amount=5")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      guard error == nil else {
        assertionFailure("Error: \(error!.localizedDescription)")
        return
      }
      guard let httpResponse = response as? HTTPURLResponse else {
        assertionFailure("Invalid response")
        return
      }
      guard let data = data, httpResponse.statusCode == 200 else {
        assertionFailure("Invalid response status code: \(httpResponse.statusCode)")
        return
      }
      let decoder = JSONDecoder()
      let response = try! decoder.decode(TriviaAPIResponse.self, from: data)
      DispatchQueue.main.async {
        completion?(response.questions)
      }
    }
    task.resume()
  }
}
