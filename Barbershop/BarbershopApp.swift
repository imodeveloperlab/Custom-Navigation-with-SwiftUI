//
//  BarbershopApp.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 15.06.2024.
//

import SwiftUI
import DSKit

@main
struct BarbershopApp: App {
    var body: some Scene {
        WindowGroup {
            RootScreen()
                .dsAppearance(RetroAppearance())
        }
    }
}
