//
//  ContentView.swift
//  Drip
//
//  Created by Sooni Mohammed on 2021-04-03.
//

import SwiftUI

struct ContentView: View {
    @State private var loopTopCircle = false
    @State private var showFunFactsView = false
    @State private var showCalculatorView = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.5764705882, blue: 0.9137254902, alpha: 1)), Color(#colorLiteral(red: 0.5019607843, green: 0.8156862745, blue: 0.7803921569, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                    .frame(height: 56)
                
                VStack(spacing: 27) {
                    Text("Water")
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    
                    Text("A colorless, transparent, odorless liquid that forms the seas, lakes, rivers, and rain and is the basis of the fluids of living organisms.")
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .tracking(-0.41)
                } //: HEADING
                
                Spacer()
                
                VStack(spacing: 24) {
                    DRButton(title: "Fun Facts", backgroundColor: Color(#colorLiteral(red: 0.3450980484485626, green: 0.33725491166114807, blue: 0.8392156958580017, alpha: 1))) { showFunFactsView = true }
                        .fullScreenCover(isPresented: $showFunFactsView) {
                            FunFactView()
                        }
                    
                    DRButton(title: "Water Calculator", backgroundColor: Color.blue) { showCalculatorView = true }
                        .fullScreenCover(isPresented: $showCalculatorView) {
                            CalculatorView()
                        }
                }
                
                Spacer()
                    .frame(height: 30)
            }
            .padding(.horizontal, 20)
            .background(
                GeometryReader { reader in
                    Ellipse()
                        .fill(Color(#colorLiteral(red: 0.327569842338562, green: 0.7603339552879333, blue: 0.9458044767379761, alpha: 1)))
                        .frame(width: 140, height: 160)
                        .rotationEffect(Angle(degrees: loopTopCircle ? 360 + 90 : 90), anchor: .topTrailing)
                        .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false))
                        .onAppear { loopTopCircle = true }
                }
            )
            .background(WaveView())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
