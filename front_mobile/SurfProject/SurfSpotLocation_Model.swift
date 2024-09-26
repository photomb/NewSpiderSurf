//
//  SurfSpotLocation_Model.swift
//  SurfProject
//
//  Created by Bertrand MARIE on 02/09/2024.
//

import Foundation

struct SurfSpot: Identifiable, Codable {
    var id = UUID()
    
    let name: String
    let latitude: Double //Double : plus grand que Float
    let longitude: Double
    let risk: String
}
