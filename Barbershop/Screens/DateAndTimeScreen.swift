//
//  DateAndTimeScreen.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 15.06.2024.
//

import SwiftUI
import DSKit

struct DateAndTimeScreen: View {
    
    @Environment(\.appearance) var appearance
    @EnvironmentObject var viewModel: BookingModel
    @EnvironmentObject var navigationManager: CustomNavigationManager
    @State var selectedDate: Date = Date()
    
    var body: some View {
        DSVStack {
            DSText("Date & Time")
                .dsTextStyle(.largeHeadline)
                .dsPadding(.top, 40)
                .fixedSize()
                .zIndex(1)
            
            DatePicker(
                "Select Date and Time",
                selection: $selectedDate,
                displayedComponents: [.date, .hourAndMinute]
            )
            .datePickerStyle(GraphicalDatePickerStyle())
            .accentColor(appearance.primaryView.button.accentColor.color)
            
            DSButton(title: "Confirm") {
                viewModel.selectedDateAndTime = selectedDate
                navigationManager.dismiss()
            }
            
            DSButton(title: "Cancel", style: .clear) {
                navigationManager.dismiss()
            }
            
            Spacer()
            
        }.onAppear {
            selectedDate = viewModel.selectedDateAndTime ?? Date()
        }.dsScreen()
    }
}

#Preview {
    DateAndTimeScreen()
        .environmentObject(BookingModel())
        .dsAppearance(RetroAppearance())
}
