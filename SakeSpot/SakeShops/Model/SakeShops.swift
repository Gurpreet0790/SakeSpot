//
//  SakeShops.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-17.
//

import Foundation
import CoreLocation


struct SakeShopsResponse: Codable{
    let listOfShops: [SakeShops]
    
    enum CodingKeys: String, CodingKey {
        case listOfShops = "shops"
    }
}


struct SakeShops : Codable, Identifiable {
    var id: UUID { UUID() } //This makes id a computed property, which is ignored by Codable.
    let title : String
    let description: String
    let image: String?
    let rating: Double
    let address: String
    let coordinates: [Double]
    let mapLink: URL
    let website: URL
    
    enum CodingKeys: String, CodingKey {
        case title = "name"
        case description
        case image = "picture"
        case rating
        case address
        case coordinates
        case mapLink = "google_maps_link"
        case website
    }
    
    var locationCoordinates: CLLocationCoordinate2D? {
        guard coordinates.count == 2 else { return nil }
        return CLLocationCoordinate2D(latitude: coordinates[0], longitude: coordinates[1])
    }
}
