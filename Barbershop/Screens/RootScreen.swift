//
//  RootView.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 15.06.2024.
//

import SwiftUI
import DSKit

struct RootScreen: View {
    
    @StateObject var viewModel = BookingModel()
    @Environment(\.appearance) var appearance
    
    var body: some View {
        TabView {
            BarbershopsScreen()
                .environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "book.closed.fill")
                    Text("Booking")
                }
            
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
            
            Text("About")
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("About")
                }
            
            Text("Bookmark")
                .tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Bookmark")
                }
        }
    }
}

#Preview {
    RootScreen()
        .dsAppearance(RetroAppearance())
}
