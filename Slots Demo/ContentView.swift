//
//  ContentView.swift
//  Slots Demo
//
//  Created by Guilherme Crozariol on 2020-06-24.
//  Copyright © 2020 Guilherme Crozariol. All rights reserved.
//

import SwiftUI

enum AlertType {
    case match, reset
}

struct ContentView: View {
    
    @State private var slotPositions: Array = [0, 1, 2]
    @State private var credits: Int = 20
    @State private var showAlert: Bool = false
    @State private var alertType: AlertType = .match
    
    private func onPressSpin() {
        slotPositions[0] = Int.random(in: 0 ... 2)
        slotPositions[1] = Int.random(in: 0 ... 2)
        slotPositions[2] = Int.random(in: 0 ... 2)
        
        if (slotPositions[0] == slotPositions[1] && slotPositions[1] == slotPositions[2]) {
            credits += 5
            showAlert = true
            self.alertType = .match
        } else {
            credits -= 1
            if credits == 0 {
                credits = 20
                showAlert = true
                self.alertType = .reset
            }
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            HeaderView()
            Spacer()
            CreditsView(credits: $credits)
            Spacer()
            HStack {
                SlotView(slotPosition: $slotPositions[0])
                SlotView(slotPosition: $slotPositions[1])
                SlotView(slotPosition: $slotPositions[2])
            }.padding()
            Spacer()
            Button(action: {self.onPressSpin()}) {
                Text("SPIN")
                    .bold()
                    .frame(width: 150, height: 50, alignment: .center)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                
            }
            
            Spacer()
        }
        .background(Color.yellow)
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: $showAlert) {
            switch alertType {
            case .match:
                return Alert(
                    title: Text("You won"),
                    message: Text("Congratulations! You just earned 5 credits."),
                    dismissButton: .default(Text("OK")))
                
            case .reset:
                return Alert(
                    title: Text("You lost"),
                    message: Text("No worries! We'll just give you another 20 credits."),
                    dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
