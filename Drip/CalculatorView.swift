//
//  CalculatorView.swift
//  Drip
//
//  Created by Sooni Mohammed on 2021-04-06.
//

import SwiftUI

struct CalculatorView: View {
    @State private var weight = ""
    @State private var isPulsating = false
    @State private var weightAmount: Double = 0
    @State var scaleAnimating = false
    @Environment(\.presentationMode) var presentationMode
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.5764705882, blue: 0.9137254902, alpha: 1)), Color(#colorLiteral(red: 0.5019607843, green: 0.8156862745, blue: 0.7803921569, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                    .frame(height: 56)
                
                Text("Water")
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                
                
                Spacer()
                
                if weightAmount == 0 {
                    
                    ScaleShape(animating: scaleAnimating)
                        .stroke(Color.black, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                        .frame(width: 300, height: 300)
                        .onReceive(timer) { time in
                            scaleAnimating.toggle()
                        }
                    
                } else {
                    VStack(spacing: 10) {
                        Text("You need")
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .tracking(0.36)
                            .multilineTextAlignment(.center)
                        
                        Text("\(weightAmount, specifier: "%.2f") mL")
                            .font(.system(.title3, design: .rounded))
                            .bold()
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .tracking(0.37)
                            .multilineTextAlignment(.center)
    
                        Text("Daily")
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .tracking(0.36)
                            .multilineTextAlignment(.center)
                    
                    }
                    .font(Font.system(.title, design: .rounded).weight(.medium))
                    .frame(width: 220, height: 220)
                    .background(
                        ZStack {
                            ZStack {
                                Circle()
                                .fill(Color(#colorLiteral(red: 0.3450980484485626, green: 0.33725491166114807, blue: 0.8392156958580017, alpha: 0.5)))
                                
                                Circle()
                                .strokeBorder(Color(#colorLiteral(red: 0.3450980484485626, green: 0.33725491166114807, blue: 0.8392156958580017, alpha: 0.5)), lineWidth: 10)
                            }
                            .frame(width: isPulsating ? 250 : 200, height: isPulsating ? 250 : 200)

                            ZStack {
                                Circle()
                                .fill(Color(#colorLiteral(red: 0.3450980484485626, green: 0.33725491166114807, blue: 0.8392156958580017, alpha: 1)))

                                Circle()
                                .strokeBorder(Color(#colorLiteral(red: 0.3450980484485626, green: 0.33725491166114807, blue: 0.8392156958580017, alpha: 1)), lineWidth: 10)
                            }
                            .frame(width: 200, height: 200)
                        }
                        .animation(
                            Animation
                                .easeInOut(duration: 1)
                                .repeatForever(autoreverses: true)
                        )
                    )
                    .animation(.spring())
                    .onAppear { isPulsating = true }
                }
                
                Spacer()
                
                VStack(spacing: 24) {
                    TextField("Enter your weight (lbs)", text: $weight, onCommit: { weightAmount = calculateWaterAmountDaily(for: Double(weight) ?? 0)
                        timer.upstream.connect().cancel()
                    })
                        .font(Font.system(.callout, design: .rounded).weight(.semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .padding(.horizontal, 16)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(Color(#colorLiteral(red: 0.522352933883667, green: 0.5484705567359924, blue: 0.5803921818733215, alpha: 1)), lineWidth: 1))
                        .padding(.horizontal, 20)
                        .animation(.easeIn)
                    
                    DRButton(title: "Calculate", backgroundColor: .blue) {
                        weightAmount = calculateWaterAmountDaily(for: Double(weight) ?? 0)
                        timer.upstream.connect().cancel()
                    }
                }
                
                Spacer()
                    .frame(height: 59)
            }
        }
        .overlay(
            Button(action: { presentationMode.wrappedValue.dismiss() }) {
                Image(systemName: "xmark")
                    .font(Font.subheadline.bold())
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .background(
                        Circle()
                            .fill(Color.blue.opacity(0.5))
                            .frame(width: 32, height: 32)
                            .shadow(color: Color.blue.opacity(0.5), radius:60, x:0, y:30)
                    )
                    .padding(.trailing, 30)
                    .padding(.top, 30)
            }
            
            , alignment: .topTrailing
        )
    }
    
    func calculateWaterAmountDaily(for weight: Double) -> Double {
        let ounces = weight * 2/3
        
        let ml = ounces * 29.574
        
        return ml
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
