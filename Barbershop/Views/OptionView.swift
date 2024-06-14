//
//  OptionView.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 15.06.2024.
//

import Foundation
import SwiftUI
import DSKit

struct OptionView: View {
    let icon: String
    let title: String
    let subtitle: String
    var body: some View {
        DSHStack(spacing: .medium) {
            DSImageView(systemName: icon, size: 23, tint: .text(.headline))
            DSVStack(spacing: .zero) {
                DSText(title)
                    .dsTextStyle(.smallHeadline)
                    .fixedSize()
                DSText(subtitle)
                    .dsTextStyle(.smallSubheadline)
            }.dsFullWidth()
            DSChevronView()
        }.dsCardStyle()
    }
}
