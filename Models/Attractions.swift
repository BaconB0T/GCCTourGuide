//
//  Attractions.swift
//  GCCTourGuide
//
//  Created by Tyler Ridout on 11/12/22.
//

import Foundation
import CoreLocation

// MARK: - AllAttractions
struct AllAttractions: Codable {
    let count: Int
    var attractions: [Attraction]
}

// MARK: - Attraction
struct Attraction: Codable, Identifiable {
    var id: UUID?
    let name, shortName, description: String
    var location: Location

    enum CodingKeys: String, CodingKey {
        case name, description, location
        case shortName = "short_name"
    }
}

// MARK: - Location
struct Location: Codable {
    var lat: Double
    var long: Double
}
