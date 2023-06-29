//
//  ProgressBar.swift
//  QuizGame
//
//  Created by Ljuba Podolszkaja on 09.05.2023.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .foregroundColor(Color.gray)
                .cornerRadius(10)
            
            Rectangle()
                .frame(width: min(progress, 350), height: 4)
                .foregroundColor(Color.red)
                .cornerRadius(10)
            
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 50)
    }
}
