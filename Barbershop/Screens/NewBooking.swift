//
//  NewBooking.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 15.06.2024.
//

import SwiftUI
import DSKit
import MapKit

struct NewBookingScreen: View {
    
    @Environment(\.appearance) var appearance
    @EnvironmentObject var viewModel: BookingModel
    @EnvironmentObject var navigationManager: CustomNavigationManager
    
    var body: some View {
        
        CustomNavigationView() {
            
            ScrollView {
                DSVStack() {
                    
                    DSText("New Booking")
                        .dsTextStyle(.largeHeadline)
                        .dsPadding(.top, 40)
                    
                    if let babershop = viewModel.selectedBabershop {
                        BarbershopView(barbershop: babershop)
                    }
                    
                    CustomNavigationLink {
                        BarbersScreen()
                    } label: {
                        VStack {
                            if let barber = viewModel.selectedBarber {
                                BarberView(barber: barber).id(barber.id)
                            } else {
                                OptionView(icon: "person.fill", title: "Barber", subtitle: "Select specialist")
                            }
                        }
                    }
                    
                    CustomNavigationLink {
                        ServicesScreen()
                    } label: {
                        VStack {
                            if let service = viewModel.selectedService {
                                ServiceView(service: service)
                                    .dsCardStyle()
                                    .dsSectionStyle(title: "Service")
                            } else {
                                OptionView(icon: "scissors.badge.ellipsis", title: "Service", subtitle: "Select service")
                            }
                        }
                    }
                    
                    CustomNavigationLink {
                        DateAndTimeScreen()
                    } label: {
                        VStack {
                            if let selectedDateAndTime = viewModel.selectedDateAndTime {
                                SelectedDateAndTimeView(date: selectedDateAndTime)
                            } else {
                                OptionView(icon: "calendar", title: "Date & Time", subtitle: "Select date and time")
                            }
                        }
                    }
                    
                    DSButton(title: "Book Now", rightSystemName: "bookmark.fill") {
                        navigationManager.dismiss()
                    }
                    
                    DSButton(title: "Cancel", style: .clear) {
                        navigationManager.dismiss()
                    }
                    
                }
            }.dsScreen()
            
        }.backgroundColor(appearance.primaryView.background.color)
    }
}
