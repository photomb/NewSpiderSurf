//
//  Model.swift
//  SurfProject
//
//  Created by Maud Gauthier on 30/08/2024.
//

import Foundation

struct Spot {
    let name: String
    let imageName: String
    let weather: [String]
    let tide: [String]
    let swellSea: String
    let wind: [String]
    let description: String
    
    init(name: String, imageName: String, weather: [String], tide: [String], swellSea: String, wind: [String], description: String) {
        self.name = name
        self.imageName = imageName
        self.weather = weather
        self.tide = tide
        self.swellSea = swellSea
        self.wind = wind
        self.description = description
    }
}
