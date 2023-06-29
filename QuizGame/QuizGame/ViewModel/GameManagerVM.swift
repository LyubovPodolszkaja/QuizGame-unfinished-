//
//  GameManager.swift
//  QuizGame
//
//  Created by Ljuba Podolszkaja on 22.08.2022.
//

import Foundation
import SwiftUI

class GameManagerVM: ObservableObject {
    private (set)var quiz: [Quiz.Result] = []
    @Published private(set)var lenght = 0
    @Published private(set)var index = 0
    @Published private(set)var reachedEnd = false
    @Published private(set)var answerIsSelected = false
    @Published private(set)var question: AttributedString = ""
    @Published private(set)var answerChoices: [Answer] = []
    @Published private(set)var progress: CGFloat = 0.00
    @Published private(set)var score = 0
    @Published private(set)var category = ""
    
    init() {
        Task.init {
            await fetchQuiz()
        }
    }
    
    func fetchQuiz() async {
        let categoryURLs = [
            "https://opentdb.com/api.php?amount=50&category=21&difficulty=medium&type=multiple",
            "https://opentdb.com/api.php?amount=50&category=22&difficulty=medium&type=multiple",
            "https://opentdb.com/api.php?amount=50&category=23&difficulty=medium&type=multiple"
           
        ]
        
        for urlStr in categoryURLs {
            guard let url = URL(string: urlStr) else {
                fatalError("Invalid URL: \(urlStr)")
            }
            
            do {
                let urlRequest = URLRequest(url: url)
                let (data, response) = try await URLSession.shared.data(for: urlRequest)
                
                guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                    fatalError("Error while fetching data")
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode(Quiz.self, from: data)
                
                DispatchQueue.main.async {
                    
                    self.quiz = decodedData.results
                    self.lenght = self.quiz.count
                    
                    if self.quiz.count >= 50 {
                        self.setQuestion()
                    }
                    
                }
            } catch {
                print("Error fetching trivia: \(error)")
            }
        }
    }
    
    func nextQuestion() {
        if index + 1 < lenght {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerIsSelected = false
        progress = CGFloat(Double(index + 1) / Double(lenght) * 350)
        
        if index < lenght {
            let currentTriviaQuestion = quiz[index]
              question = currentTriviaQuestion.formattedQuestion
              answerChoices = currentTriviaQuestion.answers
              category = currentTriviaQuestion.category
            
          }
      }
                      
    
    func selectAnswer(answer: Answer) {
        answerIsSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
     
        
      


       
                                          





  





