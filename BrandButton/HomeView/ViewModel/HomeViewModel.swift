//
//  HomeViewModel.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 01/03/2024.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    // MARK: - Properties

    /// Controls the state of fullscreen mode in the UI, enabling or disabling fullscreen presentation based on its value.
    @Published var isFullscreenEnabled: Bool = false

    /// Determines the enabled state of a button within the UI, used to enable or disable interaction based on logic or user actions.
    @Published var isButtonEnabled: Bool = true

    /// Manages the visibility of a leading icon in a UI component, such as a button or text field, to enhance user interface design.
    @Published var isLeadingIconEnabled: Bool = false

    /// Manages the visibility of a trailing icon in a UI component, similar to `isLeadingIconEnabled`, for UI customization.
    @Published var isTrailingIconEnabled: Bool = false

    /// Holds the current value of a slider component, allowing for dynamic updates and interactions within the UI.
    @Published var sliderValue: CGFloat = 15.0

    /// Defines the allowable range of values for a slider, ensuring the slider value stays within specified bounds.
    @Published var range: ClosedRange<CGFloat> = 15...25

    /// Stores the available options for a base button style, enabling dynamic UI updates and customization.
    @Published var options: [BaseButtonStyle.Variant] = [.primary, .secondary, .custom]

    /// Tracks the currently selected option for a base button style, with a mechanism to reset color settings upon change.
    @Published var selectedOption: BaseButtonStyle.Variant = .primary {
        didSet {
            resetColorSettings()
        }
    }

    /// Provides an array of available background colors for UI components, facilitating dynamic theme and appearance changes.
    @Published var backgroundColors: [BaseButtonStyle.Colors] = [
        .black, .blue, .green, .white, .orange, .pink, .cyan, .brown
    ]

    /// Holds the currently selected background color, enabling customization of UI components based on user selection or logic.
    @Published var selectedBackgroundColor: BaseButtonStyle.Colors = .green

    /// Defines an array of available text colors, supporting dynamic text color changes in UI components for better readability or aesthetic.
    @Published var textColors: [BaseButtonStyle.Colors] = [.black, .white, .orange, .pink, .cyan, .brown]

    /// Holds the currently selected text color, allowing for easy changes to text appearance across the UI.
    @Published var selectedTextColor: BaseButtonStyle.Colors = .white
    
    /// Defines the label style for text within UI components, enabling standardized or customized text appearance.
    @Published var textLabel: BaseButtonStyle.Label = .primaryDefault

    /// Resets color settings to default values, typically triggered by changes in UI state or user interactions.
    private func resetColorSettings() {
        selectedBackgroundColor = .green
        selectedTextColor = .white
        isButtonEnabled = true
        isFullscreenEnabled = false
        isLeadingIconEnabled = false
        isTrailingIconEnabled = false
    }
}

