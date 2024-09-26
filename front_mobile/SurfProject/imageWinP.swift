//
//  imageWinP.swift
//  SurfProject
//
//  Created by Maud Gauthier on 19/09/2024.
//

import SwiftUI

struct imageWinP: View {
    var body: some View {
            
            VStack {
                ZStack {
                    Image("nous2")
                        .resizable(resizingMode: .tile)
                        .aspectRatio(contentMode: .fit)
                        .frame(width:320)
                    
                    VStack {
                        AnimationWinPView()
                    }
                }
            }
        }
    }

#Preview {
    imageWinP()
}
