//
//  ServiceView.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 15.06.2024.
//

import Foundation
import SwiftUI
import DSKit

struct ServiceView: View {
    let service: ServiceDTO
    var body: some View {
        DSVStack {
            
            if let picture = service.picture {
                DSImageView(url: picture, style: .circle)
                    .dsHeight(100)
            }
            
            DSHStack(spacing: .medium) {
                DSVStack() {
                    DSText(service.title)
                        .dsTextStyle(.headline)
                    DSHStack {
                        
                        DSSFSymbolButton(name: "clock", size: .font(.subheadline))
                        
                        DSText("Duration")
                            .dsTextStyle(.subheadline)
                        
                        DSText(service.duration)
                            .dsTextStyle(.subheadline)
                    }
                    
                    DSPriceView(price: DSPrice(
                        amount: service.amount,
                        regularAmount: service.regularAmount,
                        currency: service.currency
                    ), size: .headline)
                    
                }.dsFullWidth()
            }
        }
    }
}
