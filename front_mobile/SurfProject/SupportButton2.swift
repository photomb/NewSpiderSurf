//
//  SupportButton.swift
//  SurfProject
//
//  Created by Cindy Lecat on 03/09/2024.
//

import SwiftUI

struct SupportButton2: View {
    var text: String
    var icone: String
    
    var body: some View {
        Button(action: {}){
            Image(systemName: icone)
                .foregroundColor(Color.yellow)
            
            NavigationLink(text) {
                ListingApiView()
            }
            .font(.custom("Chalkduster", size: 14))
            .foregroundColor(.white)
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors:[Color.red,Color.blue]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(60.0)
        .shadow(color: .gray, radius: 20.0, x: 20.0, y: 10.0)
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail View")
            .font(.largeTitle)
            .navigationTitle("Detail")
    }
}

#Preview {
    SupportButton2(text: "Spots de Surf", icone: "figure.surfing")
}
