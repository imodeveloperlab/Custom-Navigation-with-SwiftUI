//
//  SelectedDateAndTime.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 15.06.2024.
//

import SwiftUI
import DSKit

struct SelectedDateAndTimeView: View {
    let date: Date
    
    var body: some View {
        DSHStack(spacing: .medium) {
            DSImageView(systemName: "calendar", size: 23, tint: .text(.headline))
            DSVStack(spacing: .zero) {
                DSText(formattedDate)
                    .dsTextStyle(.smallHeadline)
                    .fixedSize()
            }.dsFullWidth()
            DSChevronView()
        }
        .dsCardStyle()
        .dsSectionStyle(title: "Date & Time")
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
