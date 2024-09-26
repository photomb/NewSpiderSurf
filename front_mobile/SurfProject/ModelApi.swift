//
//  ModelApi.swift
//  SurfProject
//
//  Created by Maud Gauthier on 17/09/2024.
//

import Foundation

struct SurfSpotapi : Identifiable, Decodable {
    var id: Int
    let name: String
    let image: String
    let city: String
    let latitude: Double
    let longitude: Double
    let risk: String
    let weather: String
    let temp: Int
    let tide: String
    let coeff: Int
    let swell_sea: String
    let wind: String
    let description: String
}
