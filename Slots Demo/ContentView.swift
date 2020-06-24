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
    
    private var slotImages = [Image("donut"), Image("lemon"), Image("apple")]
    
    @State private var slotOnePosition = 0
    @State private var slotTwoPosition = 1
    @State private var slotThreePosition = 2
    
    @State private var creditInt = 20
    
    @State private var showAlert = false
    @State private var alertType: AlertType = .match
    
    private func onPressSpin() {
        slotOnePosition = Int.random(in: 0 ... 2)
        slotTwoPosition = Int.random(in: 0 ... 2)
        slotThreePosition = Int.random(in: 0 ... 2)
        
        if (slotOnePosition == slotTwoPosition && slotTwoPosition == slotThreePosition) {
            creditInt += 5
            showAlert = true
            self.alertType = .match
        } else {
            creditInt -= 1
            if creditInt == 0 {
                creditInt = 20
                showAlert = true
                self.alertType = .reset
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(.white)
                .opacity(0.25)
                .frame(width: 200, height: 1000, alignment: .center)
                .rotationEffect(Angle(degrees: 25))
            VStack {
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                        .font(.largeTitle)
                        .foregroundColor(.orange)
                    Text("SwiftUI Slots")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Image(systemName: "star.fill")
                        .font(.largeTitle)
                        .foregroundColor(.orange)
                }
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(width: 150, height: 50, alignment: .center)
                        .cornerRadius(50)
                        .foregroundColor(.white)
                        .opacity(0.25)
                    Text("Credits: " + String(self.creditInt))
                        .foregroundColor(.black)
                }
                Spacer()
                HStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .opacity(0.75)
                        self.slotImages[self.slotOnePosition]
                    }
                    ZStack {
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .opacity(0.75)
                        self.slotImages[self.slotTwoPosition]
                    }
                    ZStack {
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .opacity(0.75)
                        self.slotImages[self.slotThreePosition]
                    }
                }
                Spacer()
                Button(action: {self.onPressSpin()}) {
                    ZStack {
                        Rectangle()
                            .frame(width: 150, height: 50, alignment: .center)
                            .cornerRadius(50)
                            .foregroundColor(.red)
                        Text("SPIN").bold().foregroundColor(.white)
                    }
                }
                Spacer()
            }
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
