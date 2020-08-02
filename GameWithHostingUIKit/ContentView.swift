//
//  ContentView.swift
//  GameWithHostingUIKit
//
//  Created by Anton on 02.08.2020.
//  Copyright © 2020 Anton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var currentValue = 100.0
    @State private var targetValue = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)!")
                .font(.subheadline)
            
            ColorUISlider(currentValue: $currentValue, opacity: computeScore() )
            
            Button(action: { self.showAlert = true })
            { Text("Проверь меня!") }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Your Score"),
                          message: Text("\(self.computeScore())"))
                    }
            Button(action: {self.targetValue = Int.random(in: 1...100)})
            {
                Text("Начать заново!")
            }
        }
        .padding()
    }
}

extension ContentView {
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
