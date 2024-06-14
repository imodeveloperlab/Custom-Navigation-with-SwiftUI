//
//  NewBooking.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 15.06.2024.
//

import SwiftUI
import DSKit

struct ServicesScreen: View {
    @EnvironmentObject var viewModel: BookingModel
    @EnvironmentObject var navigationManager: CustomNavigationManager
    var body: some View {
        ScrollView {
            DSVStack(spacing: .regular) {
                
                DSText("Services")
                    .dsTextStyle(.largeHeadline)
                    .dsPadding(.top, 40)
                    .fixedSize()
                
                ForEach(viewModel.services) { service in
                    ServiceView(service: service)
                        .dsCardStyle()
                        .onTap {
                            viewModel.selectedService = service
                            navigationManager.dismiss()
                        }
                }
            }
           
        }.dsScreen()
    }
}

#Preview {
    ServicesScreen()
        .environmentObject(BookingModel())
}
