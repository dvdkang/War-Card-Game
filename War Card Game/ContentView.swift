//
//  ContentView.swift
//  War Card Game
//
//  Created by David Kang on 12/20/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card7"
    @State var cpuCard = "card13"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    @State private var showPopup = false

    
    var body: some View {
        
        ZStack {
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
        
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }

                
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
            }
        }
        .overlay(
            ResultPopupWrapper(isPresented: $showPopup)
        )
        
        
    }
    
    func deal() {
        // randomize the players cards
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        // randomize the cpus cards
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        // update scores
        if playerCardValue > cpuCardValue {
            playerScore += 1
        }
        else if cpuCardValue > playerCardValue {
            cpuScore += 1
        }
        
        if playerCardValue == 15 {
            showPopup = true
            playerScore = 0
            cpuScore = 0
        }
        else if cpuCardValue == 15 {
            showPopup = true
            playerScore = 0
            cpuScore = 0
        }
    }
}

#Preview {
    ContentView()
}
