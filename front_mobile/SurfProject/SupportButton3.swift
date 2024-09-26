//
//  SupportButton5.swift
//  SurfProject
//
//  Created by Maud Gauthier on 19/09/2024.
//

import SwiftUI

struct SupportButton3: View {
    var text: String
    var icone: String
    
    
    var body: some View {
        Button(action: {}){
            Image(systemName: icone)
                .foregroundColor(Color.yellow)
            
            NavigationLink(text) {
                imageWinP()
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
        
        
    
    struct DetailView3: View {
        var body: some View {
            Text("Work in Progress")
                .font(.largeTitle)
                .navigationTitle("Detail")
        }
    }

#Preview {
    SupportButton3(text: "Menu",icone: "list.star")
}
