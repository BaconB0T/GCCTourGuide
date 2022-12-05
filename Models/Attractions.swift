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
    let name, shortName, description, history: String
    var funFacts: [String]? = nil
    var location: Location
    enum CodingKeys: String, CodingKey {
        case name, description, location, history
        case shortName = "short_name"
        case funFacts = "fun_facts"
    }
}

// MARK: - Location
struct Location: Codable {
    var lat: Double
    var long: Double
}
