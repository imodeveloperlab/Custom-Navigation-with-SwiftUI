//
//  SelectBarberView.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 15.06.2024.
//

import Foundation
import SwiftUI
import DSKit

struct SelectBarberView: View {
    let barber: BarberDTO
    var body: some View {
        DSVStack {
            DSHStack(spacing: .medium) {
                DSImageView(url: barber.image, style: .circle)
                    .dsSize(60)
                DSVStack(spacing: .zero) {
                    DSText(barber.name)
                        .dsTextStyle(.headline)
                    DSText(barber.grade)
                        .dsTextStyle(.subheadline)
                }.dsFullWidth()
                
                DSSFSymbolButton(name: "info.circle", size: .smallIcon)
            }
            
            DSText("Nearest time for appointment")
                .dsTextStyle(.caption2)
            
            DSGrid(columns: 4, data: barber.hours, id: \.self) { hour in
                DSText(hour)
                    .dsTextStyle(.smallHeadline)
                    .dsMaxWidthCentered()
                    .dsHeight(.actionElement)
                    .dsBackground(.primary)
                    .dsCornerRadius()
            }
        }
    }
}
