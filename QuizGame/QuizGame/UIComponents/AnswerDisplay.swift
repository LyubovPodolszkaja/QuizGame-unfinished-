//
//  AnswerDisplay.swift
//  QuizGame
//
//  Created by Ljuba Podolszkaja on 19.04.2023.
//

import SwiftUI

struct AnswerDisplay: View {
    @EnvironmentObject var gameManager: GameManagerVM
    var answer: Answer
    @State private var isSelected = false
    var green = Color.green
    var red = Color.red
    
  
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            
            Text(answer.text)
                .bold()
            
                
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? green:red)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(gameManager.answerIsSelected ? (isSelected ?  Color(.black):.yellow): Color(.black))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .indigo, radius: 5, x: 0.5, y:0.5)
        .onTapGesture {
            if !gameManager.answerIsSelected {
                isSelected = true
                gameManager.selectAnswer(answer: answer)
            }
            
            
        }
    }
}

struct AnswerDisplay_Previews: PreviewProvider {
    static var previews: some View {
        AnswerDisplay(answer: Answer(text: "Ljuba", isCorrect: false))
            .environmentObject(GameManagerVM())
    }
}
