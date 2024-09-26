//
//  ListingApiView.swift
//  SurfProject
//
//  Created by Maud Gauthier on 17/09/2024.
//

import SwiftUI

struct ListingApiView: View {
    //@State private var isLoading = true
    @State private var surfSpotapis: [SurfSpotapi] = []
    @State private var selectedSpot: SurfSpotapi?

    var body: some View {
//        NavigationSplitView {
//            if isLoading {
//                ProgressView("Loading...")
//            } else if surfSpotapis.isEmpty {
//                Text("Aucune donnée disponible")
//            } else {
                List(surfSpotapis, id: \.name) { spot in
                    NavigationLink(destination: SpotDetailsApiView(spot: spot)) {
                        HStack {
                            Image(spot.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                            
                            // Afficher les informations du surf spot
                            VStack(alignment: .leading) {
                                Text(spot.name)
                                    .font(.custom("Chalkduster", size: 18))
                                
                                Text(spot.city)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
                 .navigationTitle("Spots de Surf")
         //    }
//        } detail: {
//                if let selectedSpot = selectedSpot {
//                    SpotDetailsApiView(spot: selectedSpot)
//                } else {
//                    Text("Select a surf spot")
//                        .font(.title)
//                        .foregroundColor(.secondary)
//                }
//        }
        .onAppear {
            fetchSurfSpots()
        }
    }
    
    // Fonction pour récupérer les spots de surf
    func fetchSurfSpots() {
        // L'URL de l'API
        guard let url = URL(string: "http://localhost:8080/surfspots") else {
                    print("URL invalide")
                    return
                }
        
        // Créer la requête
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Créer la tâche de requête
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Erreur: \(error.localizedDescription)")
                return
            }
            
            // Vérifier le code de statut HTTP
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Réponse serveur invalide")
                return
            }
            
            // Traiter les données reçues
            if let data = data {
                do {
                    let jsonResponse = try JSONDecoder().decode([SurfSpotapi].self, from: data)
                    DispatchQueue.main.async {
                        self.surfSpotapis = jsonResponse
     //                   self.isLoading = false
                    }
                } catch {
                    print("Erreur lors du décodage JSON: \(error.localizedDescription)")
                }
            }
        }
        
        // Lancer la requête
        task.resume()
    }
}

#Preview {
    ListingApiView()
}
