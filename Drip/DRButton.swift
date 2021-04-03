//
//  DRButton.swift
//  Drip
//
//  Created by Sooni Mohammed on 2021-04-03.
//

import SwiftUI

struct DRButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(.title2, design: .rounded))
                .bold()
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .tracking(0.35)
                .multilineTextAlignment(.center)
                .frame(maxWidth: UIScreen.main.bounds.width - 40, maxHeight: 68)
                .background(backgroundColor)
                .cornerRadius(13)
        }
    }
}

struct DRButton_Previews: PreviewProvider {
    static var previews: some View {
        DRButton(title: "Fun Facts", backgroundColor: Color(#colorLiteral(red: 0.3450980484485626, green: 0.33725491166114807, blue: 0.8392156958580017, alpha: 1))) {}
    }
}
