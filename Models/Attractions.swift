//
//  Attractions.swift
//  GCCTourGuide
//
//  Created by Tyler Ridout on 11/12/22.
//

import Foundation

// MARK: - AllAttractions
struct AllAttractions: Codable {
    let count: Int
    var attractions: [Attraction]
}

// MARK: - Attraction
struct Attraction: Codable, Identifiable {
    var id: UUID?
    let name, shortName, description: String

    enum CodingKeys: String, CodingKey {
        case name, description
        case shortName = "short_name"
    }
}
