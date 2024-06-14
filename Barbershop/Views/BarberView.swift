//
//  BarberView.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 15.06.2024.
//

import Foundation
import SwiftUI
import DSKit

struct BarberView: View {
    let barber: BarberDTO
    var body: some View {
        DSHStack(spacing: .medium) {
            DSImageView(url: barber.image, style: .circle)
                .dsSize(50)
            DSVStack(spacing: .zero) {
                DSText(barber.name)
                    .dsTextStyle(.smallHeadline)
                DSText(barber.grade)
                    .dsTextStyle(.smallSubheadline)
            }.dsFullWidth()
            DSSFSymbolButton(name: "pencil.circle.fill", size: .mediumIcon)
        }
        .dsCardStyle()
        .dsSectionStyle(title: "Barber")
    }
}
