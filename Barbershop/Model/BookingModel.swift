//
//  BookingModel.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 15.06.2024.
//

import Foundation

final class BookingModel: ObservableObject {
    
    @Published public var selectedBarber: BarberDTO?
    @Published public var selectedBabershop: BabershopDTO?
    @Published public var selectedService: ServiceDTO?
    @Published public var selectedDateAndTime: Date?
    
    @Published public var barbershops: [BabershopDTO] = [
        .init(
            name: "Barbershop Broadway",
            address: "325 Broadway, Bayonne, NJ 07002, 7km away",
            latitude: 40.764382,
            longitude: -73.973045, 
            image: image1
        ),
        .init(
            name: "Barbershop Avenue B",
            address: "295 Avenue B, Bayonne, NJ 07002, 3km away",
            latitude: 40.6634361,
            longitude: -74.115727,
            image: image2
        ),
        .init(
            name: "Barbershop New York",
            address: "833 Broadway, New York, NY 10003, 1km away",
            latitude: 40.7337279,
            longitude: -73.9915569,
            image: image3
        ),
        .init(
            name: "Rockefeller Plaza",
            address: "45 Rockefeller Plaza, New York, NY 10111, 12km away",
            latitude: 40.7597203,
            longitude: -73.97837,
            image: image4
        ),
        .init(
            name: "Barbershop Broadway Bayonne",
            address: "923 Broadway Bayonne, NJ 07002, 23km away",
            latitude: 40.6788119,
            longitude: -74.1063384,
            image: image5
        )
    ]
    
    @Published public var barbers: [BarberDTO] = [
        .init(
            name: "Ms. Ole Thompson",
            grade: "Pro Barber",
            image: p1Image,
            hours: ["13:00", "14:00"]
        ),
        .init(
            name: "Alexander Dickinson",
            grade: "Barber",
            image: p2Image,
            hours: ["11:00", "15:00", "16:00"]
        ),
        .init(
            name: "Dulce Kub",
            grade: "Pro Barber",
            image: p3Image,
            hours: ["13:00", "14:00", "15:00", "16:00", "17:00", "18:00"]
        ),
        .init(
            name: "Nash Hansen",
            grade: "Super Pro Barber",
            image: p4Image,
            hours: ["13:00", "14:00", "15:00"]
        ),
        .init(
            name: "Perry Hudson",
            grade: "Barber",
            image: p5Image,
            hours: ["10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00"]
        ),
        .init(
            name: "John Mesh",
            grade: "Barber",
            image: p6Image,
            hours: ["17:00", "18:00", "19:00", "20:00"]
        )
    ]
   
    @Published public var services: [ServiceDTO] = [
        .init(title: "Haircut Pro Barber", duration: "1h", amount: "10.00", currency: "$"),
        .init(title: "Head Shaving Pro Barber", duration: "1h", amount: "10.00", currency: "$"),
        .init(title: "Beard Pro Barber", duration: "1h", amount: "10.00", regularAmount: "40.00", currency: "$"),
        .init(title: "Beard Tinting Pro Barber", duration: "1h", amount: "10.00", regularAmount: "15.00", currency: "$"),
        .init(title: "Beard Shaving Pro Barber", duration: "1h", amount: "10.00", currency: "$"),
        .init(title: "Beard Arranging Pro Barber", duration: "1h", amount: "10.00", currency: "$"),
        .init(title: "Haircut", duration: "1h", amount: "10.00", currency: "$"),
        .init(title: "Head Shaving", duration: "1h", amount: "10.00", currency: "$"),
        .init(title: "Children Haircut (6 - 10 years)", duration: "1h", amount: "10.00", regularAmount: "15.00", currency: "$"),
        .init(title: "Beard", duration: "1h", amount: "10.00", currency: "$"),
        .init(title: "Beard Tinting", duration: "1h", amount: "10.00", currency: "$"),
        .init(title: "Beard Shaving", duration: "1h", amount: "10.00", currency: "$"),
        .init(title: "Beard Arranging", duration: "1h", amount: "10.00", currency: "$")
    ]
}


fileprivate let barber1Image = URL(string: "https://images.unsplash.com/photo-1554387415-b0c2fcce17fd?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
fileprivate var image1 = URL(string: "https://images.unsplash.com/photo-1592647420148-bfcc177e2117?q=80&w=5039&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
fileprivate var image2 = URL(string: "https://images.unsplash.com/photo-1572663459735-75425e957ab9?q=80&w=3021&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
fileprivate var image3 = URL(string: "https://images.unsplash.com/photo-1590360316066-357b23e0dd15?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fHw%3D")
fileprivate var image4 = URL(string: "https://images.unsplash.com/photo-1603198132334-5478a1ec5bc1?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
fileprivate var image5 = URL(string: "https://images.unsplash.com/photo-1557346817-0fa9ee43e5ab?q=80&w=5070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
fileprivate let p1Image = URL(string: "https://images.unsplash.com/photo-1554387415-b0c2fcce17fd?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
fileprivate let p2Image = URL(string: "https://images.unsplash.com/photo-1567894340315-735d7c361db0?q=80&w=2537&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
fileprivate let p3Image = URL(string: "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
fileprivate let p4Image = URL(string: "https://images.unsplash.com/photo-1614289371518-722f2615943d?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
fileprivate let p5Image = URL(string: "https://images.unsplash.com/photo-1578875315363-076171ddef21?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
fileprivate let p6Image = URL(string: "https://images.unsplash.com/photo-1480455624313-e29b44bbfde1?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
