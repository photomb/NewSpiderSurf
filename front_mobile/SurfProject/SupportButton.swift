//
//  SupportButton.swift
//  SurfProject
//
//  Created by Cindy Lecat on 03/09/2024.
//

import SwiftUI

struct SupportButtonMap: View {
    var text: String
    var icone: String
    
    var body: some View {
        Button(action: {
        }) {
            VStack {
                NavigationLink(destination: MapView()) {
                    VStack {
                        Image(systemName: icone)
                            .foregroundColor(Color.yellow)
                            .padding()
                            .font(.system(size: 30))
                        Text(text)
                            .font(.custom("Chalkduster", size: 14))
                            .foregroundColor(.white)
                    }
                
                }
                .padding()
            }
            .frame(width: 160, height: 160)
            .background(LinearGradient(gradient: Gradient(colors:[Color.red,Color.blue]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(25)
            .shadow(color: .black, radius: 1, y: 2)
        }
    }
}

#Preview {
    SupportButtonMap(text: "autour d'un lieu", icone: "figure.surfing")
}
