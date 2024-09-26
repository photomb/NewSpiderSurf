//
//  PinModelView.swift
//  SurfProject
//
//  Created by Bertrand MARIE on 03/09/2024.
//

import SwiftUI
import MapKit

struct PinModelView: View {
    @State private var scale: CGFloat = 1.0 //States of echo button spot effect
    @State private var opacity: Double = 1.0 //States of echo button spot effect
    
    let risk: String //risk variable for the data of spot difficulty
    
    func colorBackPin() -> Color {
        switch risk {
        case "OK":
            return .green
        case "Medium":
            return .orange
        case "Dangerous":
            return .red
        default:
            return .blue
        }
    }
    
    var body: some View {
        
        ZStack {
            ForEach(0..<3) { echo in //loop for echo effect pin
                Circle() //central button with icon
                    .stroke(.gray)
                    .fill(colorBackPin())
                    .frame(width: 43)
                    .overlay(
                        Image(systemName: "figure.surfing")
                            .foregroundColor(.white)
                            .imageScale(.large))
                Circle() //echo circles effect
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                .frame(width: 43)
                .scaleEffect(scale)
                .opacity(opacity)
                .animation(
                    Animation.easeInOut(duration: 3)
                        .repeatForever(autoreverses: false)
                        .delay(Double(echo) * 1.1), value: scale
                )
            } //end echo effect loop
        } //end ZStack
                
            
        
        .onAppear { //scale & opacity of echo circle
            scale = 2
            opacity = 0
        } //onAppear
        
    } //end body
} //end struct

#Preview {
    PinModelView(risk: "OK")
}
