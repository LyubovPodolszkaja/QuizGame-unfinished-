//
//  Answer.swift
//  QuizGame
//
//  Created by Ljuba Podolszkaja on 19.04.2023.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
    
    
}
