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
    @Environment(\.presentationMode) var presentationMode
    
    
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
                    
                    MyCustomShape()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                    TextField("Enter your weight (lbs)", text: $weight, onCommit: { weightAmount = calculateWaterAmountDaily(for: Double(weight) ?? 0) })
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

struct Scale: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.5*width, y: 0.83333*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.3125*height))
        path.move(to: CGPoint(x: 0.33333*width, y: 0.83333*height))
        path.addLine(to: CGPoint(x: 0.66667*width, y: 0.83333*height))
        path.move(to: CGPoint(x: 0.3125*width, y: 0.54167*height))
        path.addLine(to: CGPoint(x: 0.20833*width, y: 0.25*height))
        path.addLine(to: CGPoint(x: 0.10417*width, y: 0.54167*height))
        path.move(to: CGPoint(x: 0.08333*width, y: 0.54167*height))
        path.addCurve(to: CGPoint(x: 0.20833*width, y: 0.66667*height), control1: CGPoint(x: 0.08333*width, y: 0.61083*height), control2: CGPoint(x: 0.13917*width, y: 0.66667*height))
        path.addCurve(to: CGPoint(x: 0.33333*width, y: 0.54167*height), control1: CGPoint(x: 0.2775*width, y: 0.66667*height), control2: CGPoint(x: 0.33333*width, y: 0.61083*height))
        path.addLine(to: CGPoint(x: 0.08333*width, y: 0.54167*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.89583*width, y: 0.54167*height))
        path.addLine(to: CGPoint(x: 0.79167*width, y: 0.25*height))
        path.addLine(to: CGPoint(x: 0.6875*width, y: 0.54167*height))
        path.move(to: CGPoint(x: 0.66667*width, y: 0.54167*height))
        path.addCurve(to: CGPoint(x: 0.79167*width, y: 0.66667*height), control1: CGPoint(x: 0.66667*width, y: 0.61083*height), control2: CGPoint(x: 0.7225*width, y: 0.66667*height))
        path.addCurve(to: CGPoint(x: 0.91667*width, y: 0.54167*height), control1: CGPoint(x: 0.86083*width, y: 0.66667*height), control2: CGPoint(x: 0.91667*width, y: 0.61083*height))
        path.addLine(to: CGPoint(x: 0.66667*width, y: 0.54167*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.83333*width, y: 0.25*height))
        path.addLine(to: CGPoint(x: 0.5625*width, y: 0.25*height))
        path.move(to: CGPoint(x: 0.4375*width, y: 0.25*height))
        path.addLine(to: CGPoint(x: 0.16667*width, y: 0.25*height))
        path.move(to: CGPoint(x: 0.5*width, y: 0.3125*height))
        path.addCurve(to: CGPoint(x: 0.5625*width, y: 0.25*height), control1: CGPoint(x: 0.53452*width, y: 0.3125*height), control2: CGPoint(x: 0.5625*width, y: 0.28452*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.1875*height), control1: CGPoint(x: 0.5625*width, y: 0.21548*height), control2: CGPoint(x: 0.53452*width, y: 0.1875*height))
        path.addCurve(to: CGPoint(x: 0.4375*width, y: 0.25*height), control1: CGPoint(x: 0.46548*width, y: 0.1875*height), control2: CGPoint(x: 0.4375*width, y: 0.21548*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.3125*height), control1: CGPoint(x: 0.4375*width, y: 0.28452*height), control2: CGPoint(x: 0.46548*width, y: 0.3125*height))
        path.closeSubpath()
        return path
    }
}

struct MyCustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.5*width, y: 0.83333*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.3125*height))
        path.move(to: CGPoint(x: 0.33333*width, y: 0.83333*height))
        path.addLine(to: CGPoint(x: 0.66667*width, y: 0.83333*height))
        path.move(to: CGPoint(x: 0.3125*width, y: 0.54167*height))
        path.addLine(to: CGPoint(x: 0.20833*width, y: 0.25*height))
        path.addLine(to: CGPoint(x: 0.10417*width, y: 0.54167*height))
        path.move(to: CGPoint(x: 0.08333*width, y: 0.54167*height))
        path.addCurve(to: CGPoint(x: 0.20833*width, y: 0.66667*height), control1: CGPoint(x: 0.08333*width, y: 0.61083*height), control2: CGPoint(x: 0.13917*width, y: 0.66667*height))
        path.addCurve(to: CGPoint(x: 0.33333*width, y: 0.54167*height), control1: CGPoint(x: 0.2775*width, y: 0.66667*height), control2: CGPoint(x: 0.33333*width, y: 0.61083*height))
        path.addLine(to: CGPoint(x: 0.08333*width, y: 0.54167*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.89583*width, y: 0.54167*height))
        path.addLine(to: CGPoint(x: 0.79167*width, y: 0.25*height))
        path.addLine(to: CGPoint(x: 0.6875*width, y: 0.54167*height))
        path.move(to: CGPoint(x: 0.66667*width, y: 0.54167*height))
        path.addCurve(to: CGPoint(x: 0.79167*width, y: 0.66667*height), control1: CGPoint(x: 0.66667*width, y: 0.61083*height), control2: CGPoint(x: 0.7225*width, y: 0.66667*height))
        path.addCurve(to: CGPoint(x: 0.91667*width, y: 0.54167*height), control1: CGPoint(x: 0.86083*width, y: 0.66667*height), control2: CGPoint(x: 0.91667*width, y: 0.61083*height))
        path.addLine(to: CGPoint(x: 0.66667*width, y: 0.54167*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.83333*width, y: 0.25*height))
        path.addLine(to: CGPoint(x: 0.5625*width, y: 0.25*height))
        path.move(to: CGPoint(x: 0.4375*width, y: 0.25*height))
        path.addLine(to: CGPoint(x: 0.16667*width, y: 0.25*height))
        path.move(to: CGPoint(x: 0.5*width, y: 0.3125*height))
        path.addCurve(to: CGPoint(x: 0.5625*width, y: 0.25*height), control1: CGPoint(x: 0.53452*width, y: 0.3125*height), control2: CGPoint(x: 0.5625*width, y: 0.28452*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.1875*height), control1: CGPoint(x: 0.5625*width, y: 0.21548*height), control2: CGPoint(x: 0.53452*width, y: 0.1875*height))
        path.addCurve(to: CGPoint(x: 0.4375*width, y: 0.25*height), control1: CGPoint(x: 0.46548*width, y: 0.1875*height), control2: CGPoint(x: 0.4375*width, y: 0.21548*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.3125*height), control1: CGPoint(x: 0.4375*width, y: 0.28452*height), control2: CGPoint(x: 0.46548*width, y: 0.3125*height))
        path.closeSubpath()
        return path
    }
}
