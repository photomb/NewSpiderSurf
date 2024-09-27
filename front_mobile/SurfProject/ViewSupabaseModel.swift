//
//  ViewSupabaseModel.swift
//  SurfProject
//
//  Created by Bertrand MARIE on 19/09/2024.
//

import SwiftUI

class ViewSupabaseModel: ObservableObject { //Manage data
    @Published var supaModels: [SupaModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchSupaModels() async {
        let urlString = "http://localhost:8080/surfspots"
        guard let url = URL(string: urlString) else {
            errorMessage = "invalid URL"
            return
    }
    
    isLoading = true
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode([SupaModel].self, from: data)
            DispatchQueue.main.async {
                self.supaModels = decodedData
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    
    }
}
