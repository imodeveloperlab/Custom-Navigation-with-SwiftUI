//
//  BarbershopsScreen.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 15.06.2024.
//

import SwiftUI
import DSKit

struct BarbershopsScreen: View {
    
    @EnvironmentObject var viewModel: BookingModel
    @Environment(\.appearance) var appearance
    @State var hideTabbar: Bool = false
    
    var body: some View {
        CustomNavigationView {
            ScrollView {
                DSVStack() {
                    DSText("Barbershops")
                        .dsTextStyle(.largeHeadline)
                        .dsPadding(.top, 40)
                    
                    ForEach(viewModel.barbershops, id: \.self.id) { barbershop in
                        
                        CustomNavigationLink {
                            NewBookingScreen()
                        } label: {
                            BarbershopView(
                                barbershop: barbershop
                            )
                        } onAction: {
                            viewModel.selectedBabershop = barbershop
                        }
                    }
                }.dsPadding(.bottom)
            }.dsScreen()
        }
        .backgroundColor(appearance.primaryView.background.color)
        .onPresenting { isPresenting in
            withAnimation(.spring) {
                hideTabbar = isPresenting
            }
        }.toolbar(hideTabbar ? .hidden : .visible, for: .tabBar)
    }
}
