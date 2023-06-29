//
//  NextButton.swift
//  QuizGame
//
//  Created by Ljuba Podolszkaja on 09.05.2023.
//

import SwiftUI

struct NextButton: View {
    var text: String
    var body: some View {
        let background: Color = Color.yellow
            Text(text)
                .frame(width: 90, height: 65)
                .foregroundColor(.white)
                .background(background)
                .cornerRadius(20)
                .font(.largeTitle.bold())
                .shadow(radius: 5)
                .padding()
    }
}

struct NextButton_Previews: PreviewProvider {
    static var previews: some View {
        NextButton(text: "Next")
    }
}
