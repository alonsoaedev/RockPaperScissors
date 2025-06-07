//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Alonso Acosta Enriquez on 06/08/24.
//

import SwiftUI

struct TitleText: View {
    let content: String
    
    var body: some View {
        Text(content)
            .padding(EdgeInsets(top: 2.5, leading: 0, bottom: 2.5, trailing: 0))
    }
}

struct ContentView: View {
    private let choices: [String] = ["🪨", "📄", "✂️"]
    private let winners: [String] = ["📄", "✂️", "🪨"]
    private let losers: [String] = ["✂️", "🪨", "📄"]
    
    @State private var appChoice: Int = .random(in: 0..<3)
    @State private var shouldWin: Bool = .random()
    @State private var score: Int = 0
    @State private var attempts: Int = 0
    @State private var isGameOver: Bool = false
    
    func judge(_ choice: String) -> Bool {
        let correctAnswer: String = shouldWin ? winners[appChoice] : losers[appChoice]
        return choice == correctAnswer
    }
    
    func resetGame() -> Void {
        appChoice = .random(in: 0..<3)
        shouldWin.toggle()
        score = 0
        attempts = 0
    }

    var body: some View {
        VStack {
            TitleText(content: "The app chose: \(choices[appChoice])")
            TitleText(content: "You should \(shouldWin ? "win" : "lose")")
            TitleText(content: "Attempts: \(attempts)")
        }
        .font(.system(size: 30))
        .padding()
        
        HStack {
            ForEach(choices, id: \.self) { choice in
                Button(choice) {
                    score = judge(choice) ? score + 1 : score - 1
                    
                    if (attempts >= 9) {
                        isGameOver = true
                        return
                    }
                    
                    attempts += 1
                    shouldWin.toggle()
                    appChoice = .random(in: 0..<3)
                }
                .font(.system(size: 50))
                .padding(EdgeInsets.init(top: 0, leading: 10, bottom: 0, trailing: 10))
                .alert("Game Over", isPresented: $isGameOver) {
                    Button("OK", action: resetGame)
                } message: {
                    Text("Final score: \(score)")
                }
            }
        }
        .padding(EdgeInsets.init(top: 50, leading: 0, bottom: 0, trailing: 0))
    }
}

#Preview {
    ContentView()
}
