//
//  GeographyQuizView.swift
//  QuizGame
//
//  Created by Ljuba Podolszkaja on 15.08.2022.
//

import SwiftUI

struct GeographyQuizView: View {
    @EnvironmentObject var gameManager: GameManagerVM
    
    var body: some View {
        VStack(spacing: 50){
            VStack {
                Text("\(gameManager.index + 1) out of \(gameManager.lenght)")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                
                ProgressBar(progress: gameManager.progress)
                
            }
            
            VStack(alignment: .leading, spacing: 20) {
               
                    
                if gameManager.category == "Geography"{
                    
                    Text(gameManager.question)
                        .font(.system(size:20))
                        .bold()
                        .foregroundColor(.black)
                    
                    ForEach(gameManager.answerChoices, id: \.id) { answer in AnswerDisplay(answer: answer)
                            .environmentObject(gameManager)
                    }
                }
                    
            }
            
            Button {
                gameManager.nextQuestion()
            } label: {
                NextButton(text: "Next")
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: .init(colors: [.indigo, .white]), startPoint: .zero, endPoint:.bottom))
    }
}

struct GeographyQuizView_Previews: PreviewProvider {
    static var previews: some View {
        GeographyQuizView()
            .environmentObject(GameManagerVM())
    }
}
