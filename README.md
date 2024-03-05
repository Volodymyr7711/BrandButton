# BrandButton - Customizable UI Component

## Overview

`BrandButton` is a highly customizable, easy-to-use UI component designed to meet versatile design specifications as outlined in our Figma file. This component supports multiple color variations, state changes (default, pressed, disabled), and can be seamlessly integrated into any iOS project using either UIKit or SwiftUI.

### Features:
- Multiple color variations: Green (Primary & Secondary), Blue (Primary & Secondary), and Disabled (uniform appearance for Green or Blue in Primary & Secondary forms).
- Responsive state changes: Default, Pressed, and Disabled.
- Customizable appearance: Colors, fonts, and images adjustable for each state.
- Animations for state transitions for a more interactive user experience.
- Support for both UIKit and SwiftUI, facilitating easy integration into your projects.

## Getting Started

### Prerequisites

Ensure you have Xcode installed and your project is set up for either SwiftUI or UIKit development.

### Installation

1. Clone this repository or download the source code.
2. Add the `BrandButtonView.swift` file to your project directory.
3. Ensure the file is included in your project's build phases.

### Using BrandButton in UIKit

To use `BrandButtonView` in a UIKit project, follow these steps:

```swift
import UIKit
import SwiftUI

extension UIViewController {

    func present(
        contentView: some View,
        animated: Bool,
        presentationStyle: UIModalPresentationStyle = .automatic) {

            let hosting = UIHostingController(rootView: contentView)
            hosting.modalPresentationStyle = presentationStyle
            hosting.preferredContentSize = hosting.sizeThatFits(in: view.frame.size)

            self.present(hosting, animated: animated)
        }
}
```
These lines of code help us to easy present SwiftUI View inside UIKit ViewController.


```swift
import SwiftUI
import UIKit

public final class HomeViewController: UIViewController {

    public override func viewWillAppear(_ animated: Bool) {
        presentButtonView()
    }

    func presentButtonView() {

        let brandButtonView = BrandButtonView(
            label: "Custom Text",
            fontSize: 18,
            backgroundColor: .green,
            pressedColor: .red,
            pressedLabel: "Custom Pressed",
            variant: .constant(.custom)
        )

        present(contentView: brandButtonView, animated: true)
    }
}

#Preview {
    HomeViewController()
}
```

### Using BrandButton in SwiftUI

Incorporate `BrandButtonView` into your SwiftUI views like this:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        BrandButtonView(
            label: "Hello world!"
            fontSize: 15,
            backgroundColor: .green,
            pressedColor: .red,
            pressedLabel: "Custom Pressed",
            variant: .constant(.custom)
        )
    }
}
```

## Here is a list of parameters which can be modifiable:
- label: `LocalizedStringKey`
- textColor: `Color`
- fontSize: `CGFloat`
- fontName: `BaseButtonStyle.Font`
- backgroundColor: `Color`
- pressedColor: `Color`
- pressedLabel: `LocalizedStringKey`
- variant: `BaseButtonStyle.Variant`
- leadingIcon: `Image?`
- trailingIcon: `Image`
- isFullWidthEnabled: `Bool`
- size: `BaseButtonStyle.Size`
- isEnabled: `Bool`


For detailed customization options and more examples, please refer to the documentation inside the `BrandButtonView.swift` file.

## Bonus Features

- **Customization**: Beyond basic color and state changes, you can customize fonts, background images, and more for each button state.
- **Animations**: Enjoy smooth transitions between states with built-in animations.
- **UIKit and SwiftUI Compatibility**: Whether you're a fan of UIKit or SwiftUI, `BrandButton` is designed to work seamlessly with both, including examples and documentation for each framework.

## Demo

The demo included in this project provides a comprehensive showcase of the BrandButton component, demonstrating its versatility,
ease of use, and extensive customization options. Located in the BrandButton directory, this hands-on example is designed to help you quickly understand
how to integrate and utilize `BrandButtonView` in your own projects, whether you're working with UIKit or SwiftUI.


## Running The Demo:
- Navigate to the Brand Button Directory: Locate the InitialView directory within the project files.
- Open the Demo Project: If you're using UIKit, open the HomeView+UIKit.swift. For SwiftUI, open InitialView.swift.
- Run the Project: Choose an iOS simulator or connected device and run the project. The demo application will launch.
- Interact with the Demo: Tap on the various instances of BrandButton to see the effects of different configurations and states.
  Use the controls provided to dynamically change the properties of the buttons and observe the results in real-time.
- Inspect the Code: View the source code for the demo to understand how BrandButton is implemented and customized.
  Look for comments and documentation within the code for additional guidance.


## Features Demonstrated:
- `Color Variations:` See firsthand how BrandButton adapts to different color schemes including Green Primary, Green Secondary, Blue Primary, Blue Secondary, and the uniform Disabled state.
- `State Changes:` Interact with buttons to experience the Default, Pressed, and Disabled states, complete with visual feedback.
- `Customization:` Explore how to customize the appearance of BrandButton for different states, including changes in color, font, and even adding images.
- `Animations:` Witness the smooth animations between state transitions, enhancing the user interaction experience.
- `Framework Compatibility:` Regardless of your preference for UIKit or SwiftUI, the demo illustrates how `BrandButtonView` can be seamlessly used in both environments.


