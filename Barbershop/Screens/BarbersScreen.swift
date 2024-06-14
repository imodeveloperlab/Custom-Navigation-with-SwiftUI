//
//  NewBooking.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 15.06.2024.
//

import SwiftUI
import DSKit

struct BarbersScreen: View {
    @EnvironmentObject var viewModel: BookingModel
    @EnvironmentObject var navigationManager: CustomNavigationManager
    var body: some View {
        ScrollView {
            DSVStack(spacing: .regular) {
                DSText("Barber")
                    .dsTextStyle(.largeHeadline)
                    .dsPadding(.top, 40)
                    .fixedSize()
                    .zIndex(1)
                
                ForEach(viewModel.barbers) { barber in
                    SelectBarberView(barber: barber)
                        .dsCardStyle()
                        .onTap {
                            viewModel.selectedBarber = barber
                            navigationManager.dismiss()
                        }
                }
            }
            
        }.dsScreen()
    }
}
