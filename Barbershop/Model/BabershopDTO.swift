//
//  BabershopDTO.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 14.06.2024.
//

import Foundation

class BabershopDTO: ObservableObject, Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let latitude: Double
    let longitude: Double
    let image: URL?
    
    init(
        name: String,
        address: String,
        latitude: Double,
        longitude: Double,
        image: URL?
    ) {
        self.name = name
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.image = image
    }
}
