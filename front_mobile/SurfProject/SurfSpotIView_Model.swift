//
//  SurfSpotIView_Model.swift
//  SurfProject
//
//  Created by Bertrand MARIE on 02/09/2024.
//

import SwiftUI

struct SurfSpotIViewList: View {
    var SurfSpotArr:[SurfSpot] = [
    SurfSpot(name: "Saint Jean de Monts", latitude: 46.787306, longitude: -2.071404, risk: "OK"),
    SurfSpot(name: "Les Sables d'Olonne", latitude: 46.496687, longitude: -1.784134, risk: "Medium"),
    SurfSpot(name: "Pornic", latitude: 47.115907, longitude: -2.102595, risk: "Dangerous"),
    SurfSpot(name: "Saint Gilles Croix de Vie", latitude: 46.688300, longitude: -1.938300, risk: "OK"),
    SurfSpot(name: "Saint Brevin les Pins", latitude: 47.247541, longitude: -2.168448, risk: "Dangerous")
    ]
    
    var body: some View {
        Text("SurfSpot")
        ForEach(SurfSpotArr) { spot in
            Text(spot.name)
        }
    }
}

#Preview {
    SurfSpotIViewList()
}
