//
//  SpotDetailsView.swift
//  SurfProject
//
//  Created by Maud Gauthier on 30/08/2024.
//

import SwiftUI

struct SpotDetailsView: View {
    
    let spot: Spot
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Image(spot.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width)
                
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                        .padding(.trailing, 2.0)
                    Text(spot.name)
                }
                .font(.title)
                
                HStack {
                    Button(action: {
                    }) {
                        NavigationLink(destination: ListingView()) {
                            Image(systemName: "arrow.left.circle.fill")
                                .imageScale(.large)
                                .foregroundColor(.cyan)
                        }
                    }
                    Text(spot.description)
                        .padding()
                }
                
                VStack(alignment: .leading){
                    
                    Text("Conditions de Surf aujourd'hui :")
                        .padding()
                        .bold()
                    
                    HStack{
                        Image(systemName: "cloud.sun")
                        Text("Météo : ")
                        //Text("Ensoleillée  |  28°C")
                        ForEach(spot.weather, id: \.self) { weather in
                            Text(weather)
                        }
                    }
                    .padding()
                    
                    HStack{
                        Image(systemName: "moon.haze")
                        Text("Marée : ")
                        ForEach(spot.tide, id: \.self) {
                            tide in
                            Text(tide)
                        }
                    }
                    .padding()
                    
                    HStack{
                        Image(systemName: "water.waves")
                        Text("Houle : ")
                        Text(spot.swellSea)
                    }
                    .padding()
                    
                    HStack{
                        Image(systemName: "wind")
                        Text("Vent : ")
                        ForEach(spot.wind, id: \.self) {
                            wind in
                            Text(wind)
                        }
                    }
                    .padding()
                }
                .padding(.vertical, 15.0)
                .background(RoundedRectangle(cornerRadius: 10).fill(.beige)
                    .stroke(.black, lineWidth: 2))
                
            }
        }
    }
}

#Preview {
    SpotDetailsView(spot: Spot(name: "Audierne", imageName: "audierne", weather: ["Ensoleillé", "17°C"], tide: ["Basse 5h03", "Haute 12H01"], swellSea: "1m-2m", wind: ["Nord-Ouest 15 km/h", "Ouest 10 km/h"], description: "Audierne est un spot idéal pour les surfeurs de tous niveaux, avec des vagues régulières et une belle plage."))
}
