//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Alexis Córdova on 6/11/24.
//

import SwiftUI

struct GameView: View {
    @State private var playerScore = 0
    @State private var playerShouldWin = Bool.random()
    @State private var appChoiceIndex = Int.random(in: 0...2)
    @State private var roundCount = 1
    @State private var isGameOver = false
    @State private var showGameOverAlert = false
    @State private var hasPlayerAnswered = false
    @State private var answerTitle = ""
    @State private var matchOutcome = ""
    
    var totalRounds = 10
    private var gameReset: Bool { roundCount > totalRounds }
    var moves = ["Rock", "Paper", "Scissors"]
    var movesEmoji = ["🪨", "📄", "✂️"]
    var counterMoves = ["Paper", "Scissors", "Rock"]
    
    func determineRoundWinner(_ playerChoiceIndex: Int) {
        let appMove = moves[appChoiceIndex]
        let appMoveCounter = counterMoves[appChoiceIndex]
        let playerMove = moves[playerChoiceIndex]

        if appMove == playerMove {
            answerTitle = "Draw!"
            matchOutcome = "Both players picked \(playerMove)"
            
            nextTurn()
            return
        }
        
        if playerMove == appMoveCounter {
            playerShouldWin ? correctMove() : incorrectMove()
        } else {
            playerShouldWin ? incorrectMove() : correctMove()
        }
        
        matchOutcome = "\(playerMove) \(playerShouldWin ? "beats" : "loses to") \(moves[appChoiceIndex])"
        
        nextTurn()
    }
    
    func correctMove() {
        answerTitle = "Correct!"
        playerScore += 1
    }
    
    func incorrectMove() {
        answerTitle = "Incorrect!"
        playerScore -= 1
    }
    
    func nextTurn() {
        playerShouldWin.toggle()
        appChoiceIndex = Int.random(in: 0...2)

        if roundCount + 1 > totalRounds {
            showGameOverAlert = true
            return
        }
        
        roundCount += 1
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
            answerTitle = ""
            matchOutcome = ""
        }
    }
    
    func resetGame() {
        playerScore = 0
        playerShouldWin = Bool.random()
        appChoiceIndex = Int.random(in: 0...2)
        roundCount = 1
        showGameOverAlert = false
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.orange, Color.black], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Rock, Paper, Scissors")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 20)
                
                VStack {
                    Grid {
                        GridRow {
                            Text("Player Score:")
                            Text("\(playerScore)")
                                .fontWeight(.bold)
                        }
                        
                        Divider()
                        
                        GridRow {
                            Text("Player Should:")
                            Text("\(playerShouldWin ? "Win": "Lose")")
                                .fontWeight(.bold)
                        }
                        
                        Divider()
                        
                        GridRow {
                            Text("CPU Move:")
                            Text("\(movesEmoji[appChoiceIndex]) (\(moves[appChoiceIndex]))")
                                .fontWeight(.bold)
                        }
                    }
                }
                .padding([.top, .bottom], 20)
                .multilineTextAlignment(.center)
                .background(.ultraThinMaterial)
                
                VStack {
                    Text("Round \(roundCount)")
                        .font(.largeTitle)
                        .padding(.bottom, 20)
                    Text("Your Move")
                        .font(.headline)
                    
                    HStack {
                        ForEach(0..<3) { move in
                            Button {
                                hasPlayerAnswered = true
                                determineRoundWinner(move)
                            } label: {
                                VStack {
                                    Text("\(movesEmoji[move])")
                                        .font(.system(size: 50))
                                    Text("\(moves[move])")
                                }
                            }
                            .buttonStyle(.bordered)
                            .padding([.top, .horizontal], 10)
                        }
                    }
                }
                .padding(.top, 20)
                
                Spacer()
                
                if hasPlayerAnswered {
                    VStack {
                        Text("\(answerTitle)")
                        Text("\(matchOutcome)")
                    }
                }
                
                Spacer()
            }
            .alert("Game Over", isPresented: $showGameOverAlert) {
                Button("Play Again", action: resetGame)
            } message: {
                Text("You scored \(playerScore)")
            }
            .padding(.top, 50)
            .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    GameView()
}
