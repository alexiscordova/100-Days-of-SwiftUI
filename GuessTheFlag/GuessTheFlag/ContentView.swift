//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Alexis Córdova on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var currentScore = 0
    @State private var questionsAsked = 1
    @State private var maxQuestionsReached = false
    @State private var correctAnswers = [String]()
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(currentScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(currentScore)")
        }
        .alert("Game Over", isPresented: $maxQuestionsReached) {
            Button("OK", action: resetGame)
        } message: {
            Text("""
You reached the last question!
Your final score is: \(currentScore)
""")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            currentScore += 1
            correctAnswers.insert(countries[correctAnswer], at: 0)
        } else {
            scoreTitle = "Incorrect! That's the flag of \(countries[number])"
            currentScore -= 1
        }
        
        questionsAsked += 1
        
        if questionsAsked > 8 {
            maxQuestionsReached = true
        }
        
        showingScore = true
        
    }
    
    func askQuestion() {
        shuffleCountries()
        
        if correctAnswers.contains(countries[correctAnswer]) {
            askQuestion()
        }

    }
    
    func resetGame() {
        currentScore = 0
        questionsAsked = 1
        correctAnswers.removeAll()
        
        askQuestion()
    }
    
    func shuffleCountries() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
