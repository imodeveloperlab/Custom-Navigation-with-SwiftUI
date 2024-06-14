# Custom Navigation with SwiftUI


This repository provides a prototype for creating custom navigations using SwiftUI. It features smooth transitions with `matchedGeometryEffect` and includes the Barbershop project as a practical example to showcase its capabilities. This example UI is created using the [DSKit framework](https://github.com/imodeveloperlab/dskit-swiftui), which provides flexible and customizable components for SwiftUI development.

<img src="demo.gif" width="300">

## Overview

This repository contains:

- **Custom Navigation System**: A set of SwiftUI components that enable custom navigation and transitions between views.
- **Barbershop Project**: A sample project used as a playground to showcase the custom navigation system in action.

## Features

- **Custom Navigation Manager**: Manages the presentation and dismissal of views.
- **Custom Navigation View**: A container view that handles navigation and transitions.
- **Custom Navigation Link**: A button that navigates to a new view with a smooth transition.
- **Matched Geometry Effect**: Creates cohesive and visually appealing transitions between views.

## How It Works

### Custom Navigation Components

1. **CustomNavigationManager**:
   - Manages the state of the current view and whether a view is being presented.
   - Methods to present and dismiss views with smooth animations.

2. **CustomNavigationView**:
   - A container view that displays the main content and handles background color and transitions.
   - Uses a `ZStack` to overlay views, allowing for smooth transitions.

3. **CustomNavigationLink**:
   - Provides a button that navigates to a new view when tapped.
   - Uses `matchedGeometryEffect` to create smooth transitions between the button and the destination view.

### Matched Geometry Effect

The `matchedGeometryEffect` modifier in SwiftUI allows you to link the geometry of two views, enabling seamless transitions between them. By assigning the same `id` and `namespace` to views, SwiftUI animates the transition in a visually cohesive manner.

In the custom navigation system, `matchedGeometryEffect` is used in `CustomNavigationLink` to create smooth transitions:

```swift
label
    .matchedGeometryEffect(
        id: "frame",
        in: animation,
        anchor: .top
    )

destination
    .matchedGeometryEffect(
        id: "frame",
        in: animation,
        anchor: .top
    )
```

This ensures that when the button is tapped, the transition between the label and the destination view is visually linked and smooth.

## Barbershop Project

The repository includes the Barbershop project, which serves as a playground to demonstrate the custom navigation system. This sample project showcases how to use the custom navigation components in a real-world scenario, providing a practical example for developers to follow.

## Getting Started

1. **Clone the Repository**:
   ```sh
   git clone https://github.com/yourusername/CustomNavigation.git
   ```

2. **Open the Project**:
   Open the `Barbershop.xcodeproj` file in Xcode.

3. **Run the Project**:
   Build and run the project on the simulator or a physical device to see the custom navigation in action.

## Example Usage

Here's a brief example of how to use the custom navigation components in your SwiftUI app:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomNavigationView {
            VStack {
                Text("Home View")
                    .font(.largeTitle)
                
                CustomNavigationLink(
                    destination: {
                        DetailView()
                    },
                    label: {
                        Text("Go to Detail")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                )
            }
        }
    }
}

struct DetailView: View {
    @EnvironmentObject var navigationManager: CustomNavigationManager
    
    var body: some View {
        VStack {
            Text("Detail View")
                .font(.largeTitle)
            
            Button(action: {
                navigationManager.dismiss()
            }) {
                Text("Dismiss")
                    .font(.title)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
    }
}
```

## License

This project is licensed under the MIT License.

---

This repository serves as a prototype and demonstration of how to create custom navigations with SwiftUI, using `matchedGeometryEffect` to enhance transitions. The included Barbershop project provides a practical example, showcasing the custom navigation system in action.