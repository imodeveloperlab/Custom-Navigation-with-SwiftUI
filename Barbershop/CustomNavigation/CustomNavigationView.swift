//
//  CustomNavigationView.swift
//  Barbershop
//
//  Created by Ivan Borinschi on 15.06.2024.
//

import SwiftUI

import SwiftUI

// CustomNavigationManager class manages the current view and its presentation state.
final class CustomNavigationManager: ObservableObject {
    
    // The current view being presented.
    @Published fileprivate var currentView: AnyView? = nil
    
    // Indicates whether a view is currently being presented.
    @Published var isPresenting: Bool = false
    
    // Dismisses the currently presented view.
    func dismiss() {
        isPresenting = false
        // Sets the current view to nil with a smooth animation.
        withAnimation(.smooth) {
            currentView = nil
        }
    }
    
    // Presents a new view with a smooth animation.
    fileprivate func present(view: AnyView) {
        withAnimation(.smooth) {
            // Sets the current view to the given view.
            currentView = view
            // Updates the presenting state to true.
            isPresenting = true
        }
    }
}

// CustomNavigationView is a container view that manages navigation and transitions.
struct CustomNavigationView<Content: View>: View {
    
    // State object to manage navigation.
    @StateObject private var navigationManager = CustomNavigationManager()
    
    // The content view to display.
    let content: Content
    
    // Background color of the navigation view.
    var backgroundColor: Color
    
    // Callback for when a view is presented or dismissed.
    var onPresenting: ((Bool) -> Void)?
    
    init(backgroundColor: Color = .clear, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        ZStack {
            // Background color that ignores safe areas.
            backgroundColor.ignoresSafeArea(.all)
            
            // The main content view.
            content
                .opacity(navigationManager.currentView == nil ? 1 : 0)
                .zIndex(1)
                .environmentObject(navigationManager)
            
            // The view being presented.
            if let view = navigationManager.currentView {
                view
                    .zIndex(2)
                    .environmentObject(navigationManager)
            }
        }
        // Callback for when the presenting state changes.
        .onChange(of: navigationManager.isPresenting) { newValue in
            onPresenting?(newValue)
        }
        .transition(.slide.combined(with: .fade))
    }
}

extension CustomNavigationView {
    // Method to set a background color.
    func backgroundColor(_ color: Color) -> CustomNavigationView {
        var copy = self
        copy.backgroundColor = color
        return copy
    }
    
    // Method to set the onPresenting callback.
    func onPresenting(_ onPresenting: @escaping (Bool) -> Void) -> CustomNavigationView {
        var copy = self
        copy.onPresenting = onPresenting
        return copy
    }
}

// CustomNavigationLink provides a button to navigate to a new view.
struct CustomNavigationLink<Label: View, Destination: View>: View {
    
    @Namespace private var animation
    @State var isPresented: Bool = true
    
    // Environment object to access the navigation manager.
    @EnvironmentObject var navigationManager: CustomNavigationManager
    
    // The destination view to navigate to.
    let destination: Destination
    
    // The label view for the button.
    let label: Label
    
    // Optional action to perform on button tap.
    var onAction: (() -> Void)?
    
    // Initializer for CustomNavigationLink.
    init(
        @ViewBuilder destination: () -> Destination,
        @ViewBuilder label: () -> Label,
        onAction: (() -> Void)? = nil
    ) {
        self.destination = destination()
        self.label = label()
        self.onAction = onAction
    }
    
    // The body of the view.
    var body: some View {
        Button(action: {
            self.onAction?()
            navigationManager.present(
                view:
                    AnyView(
                        Color.clear
                            .ignoresSafeArea(.all)
                            .onTapGesture { }
                            .overlay { destination }
                            .matchedGeometryEffect(
                                id: "frame",
                                in: animation,
                                anchor: .top
                            )
                    )
            )
        }) {
            label
                .matchedGeometryEffect(
                    id: "frame",
                    in: animation,
                    anchor: .top
                )
        }
    }
}
