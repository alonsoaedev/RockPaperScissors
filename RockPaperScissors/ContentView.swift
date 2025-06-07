//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Alonso Acosta Enriquez on 06/08/24.
//

import SwiftUI

struct ContentView: View {
    private let choices = ["Rock", "Paper", "Scissors"]
    
    @State private var appChoice: Int = .random(in: 0..<3)
    @State private var shouldWin: Bool = .random()

    var body: some View {
        Text("The app chose: \(choices[appChoice])")
        Text("You should \(shouldWin ? "win" : "lose")")
        
        ForEach(choices, id: \.self) { choice in
            Button(choice) {
                shouldWin.toggle()
                appChoice = .random(in: 0..<3)
            }
        }
    }
}

#Preview {
    ContentView()
}
