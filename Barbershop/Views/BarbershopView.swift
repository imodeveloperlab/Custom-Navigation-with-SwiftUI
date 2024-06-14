//
//  BarbershopView.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 15.06.2024.
//

import SwiftUI
import DSKit

struct BarbershopView: View {
    
    @EnvironmentObject var viewModel: BookingModel
    var barbershop: BabershopDTO
    
    var body: some View {
        DSVStack(spacing: .zero) {
            DSVStack(spacing: .small) {
                DSText(barbershop.name)
                    .dsTextStyle(.headline)
                    .zIndex(1)
                DSHStack {
                    DSImageView(
                        systemName: "house",
                        size: .font(.subheadline),
                        tint: .text(.smallSubheadline)
                    )

                    DSText(barbershop.address)
                        .dsTextStyle(.smallSubheadline)
                }
            }
            .fixedSize(horizontal: true, vertical: true)
            .dsPadding()
            
            DSImageView(url: barbershop.image)
                .dsHeight(100)
        }
        .dsSecondaryBackground()
        .dsCornerRadius()
    }
}
