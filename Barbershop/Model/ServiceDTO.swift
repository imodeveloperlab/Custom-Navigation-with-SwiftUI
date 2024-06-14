//
//  ServiceDTO.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 14.06.2024.
//

import Foundation

struct ServiceDTO: Identifiable {
    let id = UUID()
    var title: String
    var duration: String
    var amount: String
    var regularAmount: String?
    var currency: String
    var picture: URL?
}
