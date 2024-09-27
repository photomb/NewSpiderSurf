//
//  ListingView.swift
//  SurfProject
//
//  Created by Maud Gauthier on 30/08/2024.
//

import SwiftUI

struct ListingView: View {
    let listSpots: [Spot] = [
        Spot(
            name: "Audierne",
            imageName: "audierne",
            weather: ["Ensoleillé", "28°C"],
            tide: ["Basse 5h03", "Haute 12H01"],
            swellSea: "1m-2m",
            wind: ["Nord-Ouest 15 km/h", "Ouest 10 km/h"],
            description: "Audierne est un spot idéal pour les surfeurs de tous niveaux, avec des vagues régulières et une belle plage."
        ),
        Spot(
            name: "Baie des Trépassés",
            imageName: "baie_des_trepassees",
            weather: ["Nuageux", "15°C"],
            tide: ["Basse 7h07", "Haute 13H01"],
            swellSea: "2m-3m",
            wind: ["Sud-Ouest 20 km/h", "Nord 10 km/h"],
            description: "Un spot renommé pour ses vagues puissantes et son cadre spectaculaire, parfait pour les surfeurs expérimentés."
        ),
        Spot(
            name: "Barre d'Etel",
            imageName: "barre_detel",
            weather: ["Ensoleillé", "17°C"],
            tide: ["Basse 8h10", "Haute 14H07"],
            swellSea: "1.5m-2m",
            wind: ["Ouest 15 km/h", "Sud-Ouest 20 km/h"],
            description: "Un spot de surf connu pour ses courants puissants et ses vagues variées, situé à l'embouchure de la Ria d'Etel."
        ),
        Spot(
            name: "Brest Blanc Sablons",
            imageName: "brest_blanc_sablons",
            weather: ["Nuageux", "18°C"],
            tide: ["Basse 11h09", "Haute 15H15"],
            swellSea: "2m-4m",
            wind: ["Nord-Ouest 25 km/h", "Nord 15 km/h"],
            description: "Un grand spot de surf à proximité de Brest, offrant des vagues puissantes et un cadre naturel magnifique."
        ),
        Spot(
            name: "Crozon",
            imageName: "crozon",
            weather: ["Ensoleillé", "22°C"],
            tide: ["Basse 12h10", "Haute 16H22"],
            swellSea: "1m-3m",
            wind: ["Sud-Ouest 10 km/h", "Est 5 km/h"],
            description: "La presqu'île de Crozon est un paradis pour les surfeurs, avec plusieurs spots offrant des vagues de qualité dans un environnement préservé."
        ),
        Spot(
            name: "Dinard",
            imageName: "dinard",
            weather: ["Pluvieux", "19°C"],
            tide: ["Basse 06h49", "Haute 11H53"],
            swellSea: "0.5m-1.5m",
            wind: ["Ouest 15 km/h", "Sud 10 km/h"],
            description: "Un spot de surf tranquille à proximité de Saint-Malo, idéal pour les surfeurs débutants avec ses vagues douces."
        ),
        Spot(
            name: "Donnant",
            imageName: "donnant",
            weather: ["Ensoleillé", "21°C"],
            tide: ["Basse 11h12", "Haute 15H22"],
            swellSea: "2m-3m",
            wind: ["Sud-Ouest 15 km/h", "Ouest 20 km/h"],
            description: "Situé sur l'île de Belle-Île, Donnant est un spot de surf sauvage avec des vagues puissantes et un paysage impressionnant."
        ),
        Spot(
            name: "Douarnenez",
            imageName: "douarnenez",
            weather: ["Nuageux", "25°C"],
            tide: ["Basse 05h19", "Haute 10H15"],
            swellSea: "1m-2m",
            wind: ["Nord 10 km/h", "Nord-Ouest 15 km/h"],
            description: "Douarnenez est un spot de surf polyvalent, apprécié pour ses vagues constantes et son ambiance conviviale."
        ),
        Spot(
            name: "Fort Bloqué",
            imageName: "fort_bloque",
            weather: ["Pluvieux", "20°C"],
            tide: ["Basse 10h12", "Haute 14H15"],
            swellSea: "1.5m-2.5m",
            wind: ["Ouest 20 km/h", "Sud-Ouest 15 km/h"],
            description: "Ce spot est populaire parmi les locaux pour ses vagues régulières et son emplacement à proximité d'un fort historique."
        ),
        Spot(
            name: "Guidel Plage de la falaise",
            imageName: "guidel_plage_de_la_falaise",
            weather: ["Ensoleillé", "23°C"],
            tide: ["Basse 11h34", "Haute 15H45"],
            swellSea: "1m-2m",
            wind: ["Nord-Ouest 20 km/h", "Est 10 km/h"],
            description: "Une plage pittoresque avec de bonnes conditions de surf, souvent fréquentée par les amateurs de sports nautiques."
        ),
        Spot(
            name: "L'ile aux Vaches",
            imageName: "ile_aux_vaches",
            weather: ["Nuageux", "18°C"],
            tide: ["Basse 10h34", "Haute 14H26"],
            swellSea: "2m-4m",
            wind: ["Ouest 25 km/h", "Sud-Ouest 20 km/h"],
            description: "Connu pour ses grosses vagues et ses conditions exigeantes, c'est un spot réservé aux surfeurs les plus expérimentés."
        ),
        Spot(
            name: "La Palue",
            imageName: "la_palue",
            weather: ["Ensoleillé", "22°C"],
            tide: ["Basse 11h34", "Haute 15H54"],
            swellSea: "2m-3m",
            wind: ["Nord-Ouest 15 km/h", "Sud 10 km/h"],
            description: "Situé sur la presqu'île de Crozon, ce spot offre des vagues de haute qualité et un environnement naturel exceptionnel."
        ),
        Spot(
            name: "La Torche",
            imageName: "la_torche",
            weather: ["Ensoleillé", "26°C"],
            tide: ["Basse 09h09", "Haute 13H15"],
            swellSea: "1m-3m",
            wind: ["Ouest 20 km/h", "Sud-Ouest 15 km/h"],
            description: "La Torche est l'un des spots de surf les plus populaires en Bretagne, offrant des vagues pour tous les niveaux et un paysage spectaculaire."
        )
    ]
    
    var body: some View {
        
        NavigationSplitView {
            ZStack {
                Color.beige
                .ignoresSafeArea()
                Text("Sélectionnez un spot de surf de la liste pour en savoir plus")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .fixedSize(horizontal: false, vertical: true)
            
            //Nav Buttons
                HStack {
                    HStack {
                        Button(action: {
                        }) {
                            NavigationLink(destination: ContentView()) {
                                RoundedRectangle(cornerRadius: 20)
                                    .shadow(color: .black, radius: 1, y: 2)
                                    .frame(width: 170, height: 43)
                                    .foregroundColor(.cyan)
                                    .padding(.leading)
                                    .overlay {
                                        HStack {
                                            Image(systemName: "arrow.left.circle.fill")
                                                .imageScale(.large)
                                                .foregroundColor(.beige)
                                            Text("Back to Menu")
                                                .foregroundColor(.beige)
                                        }
                                    }
                            }
                        }
                    }
                    Spacer()
                    HStack {
                        Button(action: {
                        }) {
                            NavigationLink(destination: MapView()) {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 170, height: 43)
                                    .shadow(color: .black, radius: 1, y: 2)
                                    .foregroundStyle(.cyan)
                                    .padding(.horizontal)
                                    .overlay {
                                        HStack {
                                            Text("On the Map")
                                                .padding(.leading)
                                                .foregroundColor(.beige)
                                            Image(systemName: "arrow.right.circle.fill")
                                                .imageScale(.large)
                                                .foregroundColor(.beige)
                                        }
                                    }
                            } // end NavLink
                        } //end Button
                    } //end HStack
                } //end HStack
            
            //End of Nav Buttons
            
            List(listSpots, id: \.name) {
                spot in
                NavigationLink {
                    SpotDetailsView(spot: spot)
                    } label: {
                        HStack {
                            Image(spot.imageName)
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 70, height:70)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            Text(spot.name)
                        }
                    }
                }
        } detail: {
            ContentView()
        }
        .navigationBarBackButtonHidden(true) //Hide the Back auto Button of nav
    }
}

#Preview {
ListingView()
}
