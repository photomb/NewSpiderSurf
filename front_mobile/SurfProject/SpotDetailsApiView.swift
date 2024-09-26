//
//  SpotDetailsApiView.swift
//  SurfProject
//
//  Created by Maud Gauthier on 18/09/2024.
//

import SwiftUI

struct SpotDetailsApiView: View {
    
    let spot: SurfSpotapi
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Image(spot.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width)
                
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                        .padding(.trailing, 2.0)
                    Text(spot.name)
                        .font(.custom("Chalkduster", size: 30))
                }
                .font(.title)
                .padding()
                
                Text(spot.description)
                    .padding()
                
                VStack(alignment: .leading){
                    
                    Text("Conditions de Surf aujourd'hui :")
                        .padding()
                        .bold()
                    
                    HStack{
                        Image(systemName: "cloud.sun")
                        Text("Météo : ")
                        Text(spot.weather)
                        Text(" | ")
                        Text("\(spot.temp)")
                        Text(" °C")
                    }
                    .padding()
                    
                    HStack{
                        Image(systemName: "moon.haze")
                        Text("Marée : ")
                        Text(spot.tide)
                    }
                    .padding()
                    
                    HStack{
                        Image(systemName: "water.waves")
                        Text("Houle : ")
                        Text(spot.swell_sea)
                    }
                    .padding()
                    
                    HStack{
                        Image(systemName: "wind")
                        Text("Vent : ")
                        Text(spot.wind)
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
    SpotDetailsApiView(spot: SurfSpotapi(
        id: 3,
        name: "Barre d'Etel",
        image: "barre_detel",
        city: "Etel",
        latitude: 47.651077,
        longitude: -3.225147,
        risk: "medium",
        weather: "Nuageux",
        temp: 17,
        tide: "BM: 08h10 - HM: 14H07",
        coeff: 87,
        swell_sea: "1.5-2m",
        wind: "Ouest 12 km/h",
        description: "Un spot de surf connu pour ses courants puissants et ses vagues variées, situé à l'embouchure de la Ria d'Etel."))
}
