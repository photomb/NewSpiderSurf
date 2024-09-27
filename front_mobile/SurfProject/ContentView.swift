//
//  ContentView.swift
//  SurfProject
//
//  Created by Bertrand MARIE on 26/08/2024.
//

import SwiftUI

struct ContentView : View {
    
    var body: some View {
        
        NavigationStack {
            
            ZStack(alignment: .bottom) {
                ZStack {
                    Image("spidermanSurfing")
                        //.resizable(resizingMode: .tile)
                        //.aspectRatio(contentMode: .fit)
                        .frame(width: 1024)
                    VStack {
                        AnimationTitle()
                    }
                    .padding()
                }
                HStack { //Buttons Created
                    SupportButtonMap(text: "On the Map again", icone: "map.fill")
                    SupportButtonListSpots(text: "King of Spots", icone: "figure.surfing")
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
