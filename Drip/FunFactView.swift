//
//  FunFactViw.swift
//  Drip
//
//  Created by Sooni Mohammed on 2021-04-04.
//

import SwiftUI

struct FunFactView: View {
    @State private var facts = [
        Fact(id: 0, name: "A person can survive a week with no water", color: Color(#colorLiteral(red: 0.09803921729326248, green: 0.12941177189350128, blue: 0.3137255012989044, alpha: 1)), offset: 0),
        Fact(id: 1, name: "97% of the world's water is undrinkable", color: Color(#colorLiteral(red: 0.9882352948188782, green: 0.40392157435417175, blue: 0.3529411852359772, alpha: 1)), offset: 0),
        Fact(id: 2, name: "Water regulates the Earth's temperature", color: Color(#colorLiteral(red: 0.2235294133424759, green: 0.07450980693101883, blue: 0.7215686440467834, alpha: 1)), offset: 0),
        Fact(id: 3, name: "Water expands by 9% when it freezes", color: Color(#colorLiteral(red: 0.5137255191802979, green: 0.32156863808631897, blue: 0.9921568632125854, alpha: 1)), offset: 0)
    ]
    @State private var scrolled = 0
     @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.5764705882, blue: 0.9137254902, alpha: 1)), Color(#colorLiteral(red: 0.5019607843, green: 0.8156862745, blue: 0.7803921569, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                    .frame(height: 56)
                
                Text("Fun Facts")
                    .font(.system(size: 60, weight: .bold, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                
                ZStack {
                    ForEach(facts.reversed()) { fact in
                        ExtractedView(fact: fact, scrolled: $scrolled, facts: $facts)
                    }
                }
                .frame(height: UIScreen.main.bounds.height / 1.8)
                .padding(.horizontal, 25)
                .padding(.top, 25)
                Spacer()
                
                Link(destination: URL(string: "https://www3.epa.gov/safewater/kids/waterfactsoflife.html") ?? URL(string: "https://www.apple.com")!) {
                    Text("See Source")
                        .font(.system(.title2, design: .rounded))
                        .bold()
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .tracking(0.35)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: UIScreen.main.bounds.width - 40, maxHeight: 68)
                        .background(Color.blue)
                        .cornerRadius(13)
                        .padding(.bottom)
                }
            }
            .padding(.horizontal, 20)
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
}

struct FunFactView_Previews: PreviewProvider {
    static var previews: some View {
        FunFactView()
    }
}

struct Fact: Identifiable {
    var id: Int
    let name: String
    let color: Color
    var offset: CGFloat
}



struct ExtractedView: View {
    
    var fact: Fact
    @Binding var scrolled: Int
    @Binding var facts: [Fact]
    
    func calculateWidth() -> CGFloat {
        let screen = UIScreen.main.bounds.width - 20
        
        let width = screen - (2 * 30)
        
        return width
    }
    
    var body: some View {
        HStack {
            Text(fact.name)
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .tracking(0.37)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 289)
                .frame(width: calculateWidth(), height: (UIScreen.main.bounds.height / 1.8) - CGFloat((fact.id - scrolled) * 50))
                .background(fact.color)
                .shadow(color: fact.color.opacity(0.25), radius: 60, x: 0, y: 30)
                .cornerRadius(30)
                .offset(x: fact.id - scrolled <= 2 ? CGFloat(fact.id - scrolled) * 30 : 60)
            
            Spacer(minLength: 0)
        }
        .contentShape(Rectangle())
        .offset(x: fact.offset)
        .gesture(
            DragGesture()
                .onChanged { value in
                    withAnimation {
                        if value.translation.width < 0 && fact.id != facts.last?.id {
                            facts[fact.id].offset = value.translation.width
                        } else {
                            if fact.id > 0 {
                                facts[fact.id - 1].offset = -(calculateWidth() + 60) + value.translation.width
                            }
                        }
                    }
                }
                .onEnded { value in
                    withAnimation {
                        if value.translation.width < 0 {
                            if -value.translation.width > 180 && fact.id != facts.last!.id {
                                facts[fact.id].offset = -(calculateWidth() + 60)
                                scrolled += 1
                            } else {
                                facts[fact.id].offset = 0
                            }
                        } else {
                            if fact.id > 0 {
                                if value.translation.width > 180 {
                                    facts[fact.id - 1].offset = 0
                                    scrolled -= 1
                                } else {
                                    facts[fact.id - 1].offset = -(calculateWidth() + 60)
                                }
                            }
                        }
                    }
                }
        )
    }
}
