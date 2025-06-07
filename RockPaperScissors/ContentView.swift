//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Alonso Acosta Enriquez on 06/08/24.
//

import SwiftUI

struct ContentView: View {
    private let choices: [String] = ["Rock", "Paper", "Scissors"]
    private let winners: [String] = ["Paper", "Scissors", "Rock"]
    private let losers: [String] = ["Scissors", "Rock", "Paper"]
    
    @State private var appChoice: Int = .random(in: 0..<3)
    @State private var shouldWin: Bool = .random()
    @State private var score: Int = 0
    
    func judge(_ choice: String) -> Bool {
        let correctAnswer: String = shouldWin ? winners[appChoice] : losers[appChoice]
        return choice == correctAnswer
    }

    var body: some View {
        Text("The app chose: \(choices[appChoice])")
        Text("You should \(shouldWin ? "win" : "lose")")
        Text("Score: \(score)")
        
        ForEach(choices, id: \.self) { choice in
            Button(choice) {
                score = judge(choice) ? score + 1 : score - 1
                shouldWin.toggle()
                appChoice = .random(in: 0..<3)
            }
        }
    }
}

#Preview {
    ContentView()
}
