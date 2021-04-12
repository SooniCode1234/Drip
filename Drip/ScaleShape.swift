
//  ScaleShape.swift
//  Drip
//
//  Created by Sooni Mohammed on 2021-04-07.
//

import SwiftUI

struct ScaleShape: Shape {
    var animating: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let height = rect.size.height
        let width = rect.size.width
        
        // MARK: - POLE
        path.move(to: CGPoint(x: 0.5*width, y: 0.94444*height))
        
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.25*height))
        
        // MARK: - BASE
        if animating {
            path.move(to: CGPoint(x: 0.31818*width, y: 0.94444*height))
            
            path.addLine(to: CGPoint(x: 0.68182*width, y: 0.94444*height))
            
            // MARK: - SECOND BRANCH OF THE SECOND SWING
            path.move(to: CGPoint(x: 0.93182*width, y: 0.66667*height))
            
            path.addLine(to: CGPoint(x: 0.81818*width, y: 0.27778*height))
            
            path.addLine(to: CGPoint(x: 0.70455*width, y: 0.66667*height))
            
            // MARK: - FIRST HALF OF THE SECOND CIRCLE
            path.move(to: CGPoint(x: 0.68182*width, y: 0.66667*height))
            
            path.addCurve(to: CGPoint(x: 0.81818*width, y: 0.83333*height), control1: CGPoint(x: 0.68182*width, y: 0.75889*height), control2: CGPoint(x: 0.74273*width, y: 0.83333*height))
            
            path.addCurve(to: CGPoint(x: 0.95455*width, y: 0.66667*height), control1: CGPoint(x: 0.89364*width, y: 0.83333*height), control2: CGPoint(x: 0.95455*width, y: 0.75889*height))
            
            path.addLine(to: CGPoint(x: 0.68182*width, y: 0.66667*height))
            
            path.closeSubpath()
            
            
            // MARK: - SECOND BRANCH OF THE FIRST SWING
            path.move(to: CGPoint(x: 0.295405*width, y: 0.44444*height))
            
            path.addLine(to: CGPoint(x: 0.18182*width, y: 0.05556*height))
            
            path.addLine(to: CGPoint(x: 0.06818*width, y: 0.44444*height))
            
            
            // MARK: - FIRST HALF OF THE FIRST CIRCLE
            path.move(to: CGPoint(x: 0.04545*width, y: 0.44444*height))
            
            path.addCurve(to: CGPoint(x: 0.18182*width, y: 0.61111*height), control1: CGPoint(x: 0.04545*width, y: 0.53667*height), control2: CGPoint(x: 0.10636*width, y: 0.61111*height))
            
            path.addCurve(to: CGPoint(x: 0.31818*width, y: 0.44444*height), control1: CGPoint(x: 0.25727*width, y: 0.61111*height), control2: CGPoint(x: 0.31818*width, y: 0.53667*height))
            
            path.addLine(to: CGPoint(x: 0.04545*width, y: 0.44444*height))
            
            path.closeSubpath()
            
            
            // MARK: - SECOND TOTTER LINE
            path.move(to: CGPoint(x: 0.86363*width, y: 0.29388*height))
            
            path.addLine(to: CGPoint(x: 0.565*width, y: 0.18944*height))
            
            
            // MARK: - FIRST TOTTER LINE
            path.move(to: CGPoint(x: 0.435*width, y: 0.14389*height))
            
            path.addLine(to: CGPoint(x: 0.13636*width, y: 0.03944*height))
            
            
            // MARK: - SECOND HALF OF THE MAIN CIRCLE
            path.move(to: CGPoint(x: 0.5*width, y: 0.25*height))
            
            path.addCurve(to: CGPoint(x: 0.56818*width, y: 0.16667*height), control1: CGPoint(x: 0.53765*width, y: 0.25*height), control2: CGPoint(x: 0.56818*width, y: 0.21269*height))
            
            path.addCurve(to: CGPoint(x: 0.5*width, y: 0.08333*height), control1: CGPoint(x: 0.56818*width, y: 0.12064*height), control2: CGPoint(x: 0.53765*width, y: 0.08333*height))
            
            path.addCurve(to: CGPoint(x: 0.43182*width, y: 0.16667*height), control1: CGPoint(x: 0.46235*width, y: 0.08333*height), control2: CGPoint(x: 0.43182*width, y: 0.12064*height))
            
            path.addCurve(to: CGPoint(x: 0.5*width, y: 0.25*height), control1: CGPoint(x: 0.43182*width, y: 0.21269*height), control2: CGPoint(x: 0.46235*width, y: 0.25*height))
            
            path.closeSubpath()
        } else {
            
            
            path.move(to: CGPoint(x: 0.68182*width, y: 0.94444*height))
            
            path.addLine(to: CGPoint(x: 0.31818*width, y: 0.94444*height))
            
            path.move(to: CGPoint(x: 0.06818*width, y: 0.66667*height))
            
            path.addLine(to: CGPoint(x: 0.18182*width, y: 0.27778*height))
            
            path.addLine(to: CGPoint(x: 0.29545*width, y: 0.66667*height))
            
            path.move(to: CGPoint(x: 0.31818*width, y: 0.66667*height))
            
            path.addCurve(to: CGPoint(x: 0.18182*width, y: 0.83333*height), control1: CGPoint(x: 0.31818*width, y: 0.75889*height), control2: CGPoint(x: 0.25727*width, y: 0.83333*height))
            
            path.addCurve(to: CGPoint(x: 0.04545*width, y: 0.66667*height), control1: CGPoint(x: 0.10636*width, y: 0.83333*height), control2: CGPoint(x: 0.04545*width, y: 0.75889*height))
            
            path.addLine(to: CGPoint(x: 0.31818*width, y: 0.66667*height))
            
            path.closeSubpath()
            
            path.move(to: CGPoint(x: 0.70455*width, y: 0.44444*height))
            
            path.addLine(to: CGPoint(x: 0.81818*width, y: 0.05556*height))
            
            path.addLine(to: CGPoint(x: 0.93182*width, y: 0.44444*height))
            
            path.move(to: CGPoint(x: 0.95455*width, y: 0.44444*height))
            
            path.addCurve(to: CGPoint(x: 0.81818*width, y: 0.61111*height), control1: CGPoint(x: 0.95455*width, y: 0.53667*height), control2: CGPoint(x: 0.89364*width, y: 0.61111*height))
            
            path.addCurve(to: CGPoint(x: 0.68182*width, y: 0.44444*height), control1: CGPoint(x: 0.74273*width, y: 0.61111*height), control2: CGPoint(x: 0.68182*width, y: 0.53667*height))
            
            path.addLine(to: CGPoint(x: 0.95455*width, y: 0.44444*height))
            
            path.closeSubpath()
            
            path.move(to: CGPoint(x: 0.13637*width, y: 0.29388*height))
            
            path.addLine(to: CGPoint(x: 0.43501*width, y: 0.18944*height))
            
            path.move(to: CGPoint(x: 0.565*width, y: 0.14389*height))
            
            path.addLine(to: CGPoint(x: 0.86364*width, y: 0.03944*height))
            
            path.move(to: CGPoint(x: 0.5*width, y: 0.25*height))
            
            path.addCurve(to: CGPoint(x: 0.43182*width, y: 0.16667*height), control1: CGPoint(x: 0.46235*width, y: 0.25*height), control2: CGPoint(x: 0.43182*width, y: 0.21269*height))
            
            path.addCurve(to: CGPoint(x: 0.5*width, y: 0.08333*height), control1: CGPoint(x: 0.43182*width, y: 0.12064*height), control2: CGPoint(x: 0.46235*width, y: 0.08333*height))
            
            path.addCurve(to: CGPoint(x: 0.56818*width, y: 0.16667*height), control1: CGPoint(x: 0.53765*width, y: 0.08333*height), control2: CGPoint(x: 0.56818*width, y: 0.12064*height))
            
            path.addCurve(to: CGPoint(x: 0.5*width, y: 0.25*height), control1: CGPoint(x: 0.56818*width, y: 0.21269*height), control2: CGPoint(x: 0.53765*width, y: 0.25*height))
            
            path.closeSubpath()
        }
        
        
        return path
    }
}

struct ScaleShape_Previews: PreviewProvider {
    static var previews: some View {
        ScaleShape(animating: true)
            .stroke(Color.black, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
            .frame(width: 100, height: 100)
    }
}

