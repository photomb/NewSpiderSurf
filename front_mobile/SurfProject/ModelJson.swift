//
//  ModelJSON.swift
//  SurfProject
//
//  Created by Maud Gauthier on 03/09/2024.
//

import Foundation

//let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

// MARK: - Welcome
struct Welcome: Codable {
    let records: [Record]
}

// MARK: - Record
struct Record: Codable, Identifiable {
    let id: String
    let fields: Fields
}

// MARK: - Fields
struct Fields: Codable {
    let surfBreak: [String]
    let destination: String
    let photos: [Photo]

    enum CodingKeys: String, CodingKey {
        case surfBreak = "Surf Break"
        case destination = "Destination"
        case photos = "Photos"
    }
}

// MARK: - Photo
struct Photo: Codable {
    let url: String
}

