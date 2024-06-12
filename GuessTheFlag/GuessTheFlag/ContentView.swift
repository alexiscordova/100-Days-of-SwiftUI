//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Alexis Córdova on 4/15/24.
//

import SwiftUI

struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct CountryName: View {
    var country: String
    
    var body: some View {
        Text(country)
            .font(.largeTitle.weight(.semibold))
    }
}

struct CurrentScore: View {
    var score: Int
    var questionsAsked: Int
    
    var body: some View {
        Text("Score: \(score)/\(questionsAsked)")
            .foregroundStyle(.white)
            .font(.title.bold())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.weight(.bold))
            .foregroundStyle(.white)
    }
}

struct ContentBox: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func contentBoxStyle() -> some View {
        modifier(ContentBox())
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var currentScore = 0
    @State private var questionsAsked = 0
    @State private var maxQuestionsReached = false
    @State private var correctAnswers = [String]()
    
    let maxQuestions = 7
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            currentScore += 1
            correctAnswers.insert(countries[correctAnswer], at: 0)
        } else {
            scoreTitle = "Incorrect! That's the flag of \(countries[number])"
        }
        
        questionsAsked += 1
        
        showingScore = true
    }
    
    func askQuestion() {
        if questionsAsked > maxQuestions {
            maxQuestionsReached = true
            return
        }
        
        shuffleCountries()
        
        if correctAnswers.contains(countries[correctAnswer]) {
            askQuestion()
        }

    }
    
    func resetGame() {
        currentScore = 0
        questionsAsked = 0
        correctAnswers.removeAll()
        
        askQuestion()
    }
    
    func shuffleCountries() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

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
                    .titleStyle()
                
                Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        CountryName(country: countries[correctAnswer])
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(country: countries[number])
                        }
                    }
                }
                .contentBoxStyle()
                
                Spacer()
                Spacer()
                
                CurrentScore(score: currentScore, questionsAsked: questionsAsked)
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(currentScore)/\(questionsAsked)")
        }
        .alert("Game Over", isPresented: $maxQuestionsReached) {
            Button("OK", action: resetGame)
        } message: {
            Text("""
You reached the last question!
Your final score is: \(currentScore)/\(questionsAsked)
""")
        }
    }
}

#Preview {
    ContentView()
}
