//
//  BackSupabaseModel.swift
//  SurfProject
//
//  Created by Bertrand MARIE on 19/09/2024.
//

import Foundation

struct SupaModel: Codable, Identifiable {
    var id:             Int32
    var name:           String
    var image:          String
    var city:           String
    var latitude:       Double
    var longitude:      Double
    var risk:           String
    var weather:        String
    var temp:           Int32
    var tide:           String
    var coeff:          Int32
    var swell_sea:      String
    var wind:           String
    var description:    String
}
