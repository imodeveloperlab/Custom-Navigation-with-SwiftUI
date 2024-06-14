//
//  BarberDTO.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 14.06.2024.
//

import Foundation

struct BarberDTO: Identifiable {
    let id = UUID()
    let name: String
    let grade: String
    let image: URL?
    let hours: [String]
}
