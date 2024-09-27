//
//  DataViewSupabaseModel.swift
//  SurfProject
//
//  Created by Bertrand MARIE on 19/09/2024.
//

import SwiftUI

struct DataViewSupabaseModel: View {
    @StateObject var viewSupaModel = ViewSupabaseModel()
    
    var body: some View {
            NavigationView {
                VStack {
                    if viewSupaModel.isLoading {
                        ProgressView("Loading...")
                    } else if let errorMessage = viewSupaModel.errorMessage {
                        Text("Error: \(errorMessage)")
                            .foregroundColor(.red)
                    } else {
                        List(viewSupaModel.supaModels) { spot in
                            VStack(alignment: .leading) {
                                Text(spot.name).font(.headline)
                                Text("Latitude: \(spot.latitude), Longitude: \(spot.longitude)")
                                Text("Risk: \(spot.risk)")
                            }
                        }
                    }
                }
                .navigationTitle("Surf Spots")
                .task {
                    await viewSupaModel.fetchSupaModels()
                }
            }
        }
    
}

#Preview {
    DataViewSupabaseModel()
}
