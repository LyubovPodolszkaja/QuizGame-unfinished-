//
//  ContentView.swift
//  QuizGame
//
//  Created by Ljuba Podolszkaja on 15.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameManager = GameManagerVM()

 
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: .init(colors: [.mint,.indigo]), startPoint: .zero, endPoint: .center)
                    .ignoresSafeArea()
                
                VStack(spacing:250) {
                    Text("QUIZ GAME")
                        .font(.system(size: 50))
                        .bold()
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    
                    VStack {
                        
                        VStack(spacing: 20) {
                            NavigationLink {
                                HistoryQuizView()
                                    .navigationBarHidden(true)
                                    .environmentObject(gameManager)
                                    
                                
                            }label: {
                                CategoryButton(text:"History")
                                
                            }
                            
                            NavigationLink {
                                GeographyQuizView()
                                    .navigationBarHidden(true)
                                    .environmentObject(gameManager)
                                
                            }label: {
                                CategoryButton(text: "Geography")
                                
                            }
                            NavigationLink {
                                SportQuizView()
                                    .navigationBarHidden(true)
                                    .environmentObject(gameManager)
                                
                            }label: {
                                CategoryButton(text:"Sport")
                                
                            }
                            
                        }
                        
                    }
                    .frame(width: 350, height: 400)
                    .background(.ultraThinMaterial)
                    .cornerRadius(40)
                }
            }
        }
    }
}
                            
                        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
