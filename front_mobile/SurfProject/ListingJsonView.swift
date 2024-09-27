//
//  ListingJsonView.swift
//  SurfProject
//
//  Created by Maud Gauthier on 03/09/2024.
//

import SwiftUI

struct ListingJsonView: View {

    @State private var modelJsons: Welcome? = nil
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            if isLoading {
                ProgressView("Loading...")
            } else if let records = modelJsons?.records {
                List(records) { record in
                    HStack {
                        // Afficher la première photo si disponible
                        if let firstPhoto = record.fields.photos.first,
                           let url = URL(string: firstPhoto.url) {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 70, height: 70)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 70, height: 70)
                                        .clipShape(Circle())
                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 70, height: 70)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        } else {
                            // Image de remplacement si aucune photo
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                        }
                        
                        // Afficher le premier "Surf Break" si disponible
                        VStack(alignment: .leading) {
                            if let firstSurfBreak = record.fields.surfBreak.first {
                                Text(firstSurfBreak)
                                    .font(.headline)
                            } else {
                                Text("Surf Break Inconnu")
                                    .font(.headline)
                            }
                            
                            // Optionnel : Afficher la destination
                            Text(record.fields.destination)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 5)
                }
                .navigationTitle("Surf Breaks")
            } else {
                Text("Aucune donnée disponible")
            }
        }
        .onAppear {
            fetchSurfDestinations()
        }
    }
    
    func fetchSurfDestinations() {
        // L'URL de l'API
        guard let url = URL(string: "https://api.airtable.com/v0/appb1wPyQ3hv7zl38/Surf%20Destinations") else {
            print("URL invalide")
            return
        }
        
        // Créer la requête
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Ajouter le token d'authentification dans l'en-tête
        let token = "patRBBxmyGCkyUwwN.82110d72c30edfd355d838e2663abcb06752635a19f86995c4faece36530f25e"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
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
                    let jsonResponse = try JSONDecoder().decode(Welcome.self, from: data)
                    DispatchQueue.main.async {
                        self.modelJsons = jsonResponse
                        self.isLoading = false
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
    ListingJsonView()
}
