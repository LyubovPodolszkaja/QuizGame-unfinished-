//
//  CategoryButton.swift
//  QuizGame
//
//  Created by Ljuba Podolszkaja on 15.08.2022.
//

import SwiftUI

struct CategoryButton: View {
    var text: String
    var background: Color = Color.indigo
    
    var body: some View {
        Text(text)
            .frame(width: 200, height: 80)
            .foregroundColor(.white)
            .background(background)
            .cornerRadius(50)
            .shadow(radius: 20)
            .font(.largeTitle.bold())
            .padding()
            
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButton(text: "Category")
    }
}
