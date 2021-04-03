//
//  WaveView.swift
//  Drip
//
//  Created by Sooni Mohammed on 2021-04-03.
//

import SwiftUI

struct WaveView: View {
    let universalSize = UIScreen.main.bounds
    @State private var isAnimated = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.5764705882, blue: 0.9137254902, alpha: 1)), Color(#colorLiteral(red: 0.5019607843, green: 0.8156862745, blue: 0.7803921569, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            getSinWave(interval: universalSize.width, amplitude: 200, baseline: -50 + universalSize.height / 2)
                .fill(Color(red: 0.3, green: 0.6, blue: 1))
                .opacity(0.4)
                .offset(x: isAnimated ? -1 * universalSize.width : 0)
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
            
            getSinWave(interval: universalSize.width * 1.2, amplitude: 150, baseline: universalSize.height / 2 + 50)
                .fill(Color(red: 0.3, green: 0.6, blue: 1))
                .opacity(0.4)
                .offset(x: isAnimated ? -1 * universalSize.width * 1.2 : 0)
                .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false))
        }
        .onAppear {
            isAnimated = true
        }
    }
    
    func getSinWave(interval: CGFloat, amplitude: CGFloat = 100, baseline: CGFloat = UIScreen.main.bounds.height / 2) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: baseline))
                
            path.addCurve(to: CGPoint(x: 1 * interval, y: baseline),
                          control1: CGPoint(x: interval * 0.35, y: amplitude + baseline),
                          control2: CGPoint(x: interval * 0.65, y: -amplitude + baseline))
            
            path.addCurve(to: CGPoint(x: 2 * interval, y: baseline),
                          control1: CGPoint(x: interval * 1.35, y: amplitude + baseline),
                          control2: CGPoint(x: interval * 1.65, y: -amplitude + baseline))
            
            path.addLine(to: CGPoint(x: 2 * interval, y: universalSize.height))
            path.addLine(to: CGPoint(x: 0, y: universalSize.height))
        }
    }
}

struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        WaveView()
    }
}
