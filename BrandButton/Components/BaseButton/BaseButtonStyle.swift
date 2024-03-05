//
//  BaseButtonStyle+Extensions.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 04/03/2024.
//

import SwiftUI

public enum BaseButtonStyle {
    // MARK: - Enums

    /// Defines the size options for the Brand Button.
    enum Size: Equatable {
        /// The regular, default size of the Brand Button.
        case regular
        /// A medium size, slightly smaller than the default.
        case medium
    }

    /// Defines the variant options for the Brand Button.
    enum Variant: String, CaseIterable {
        /// The primary variant, typically used for the main action.
        case primary
        /// The secondary variant, used for less prominent actions.
        case secondary
        /// A custom variant, allowing for more specific styling.
        case custom
    }

    /// Defines color options for the Brand Button.
    enum Colors {
        /// Default Red Color
        case red
        /// Primary Light Green Color
        case lightGreen
        /// Primary  Green Color
        case green
        /// Default Gray Color
        case gray
        /// Primary Dark Green Color
        case darkGreen
        /// Primary Light Blue Color
        case lightBlue
        /// Primary  Blue Color
        case blue
        /// Primary Dark Blue Color
        case darkBlue
        /// White Color
        case white
        /// Default Black Color
        case black
        /// Default Yellow Color
        case yellow
        /// Default Orange Color
        case orange
        /// Default Pink Color
        case pink
        /// Default Cyan Color
        case cyan
        /// Default Brown Color
        case brown

        var value: Color {

            switch self {

            case .red:
                return .red

            case .lightGreen:
                return Color(hex: "#ECF3E6")

            case .green:
                return Color(hex: "#428500")

            case .gray:
                return Color(hex: "#9BA2A6")
                
            case .darkGreen:
                return Color(hex: "#316300")

            case .lightBlue:
                return Color(hex: "#E5F2F6")

            case .blue:
                return Color(hex: "#007FAD")

            case .darkBlue:
                return Color(hex: "#005F81")

            case .white:
                return .white

            case .black:
                return .black

            case .yellow:
                return .yellow

            case .orange:
                return .orange

            case .pink:
                return .pink

            case .cyan:
                return .cyan

            case .brown:
                return .brown
            }
        }
    }

    /// Defines label options for the Brand Button.
    enum Label {
        /// Default Primary Label
        case primaryDefault
        /// Default Primary Presed Label
        case primaryPressed
        /// Primary Disabled Label
        case primaryDisabled
        /// Default Secondary Label
        case secondaryDefault
        /// Default Secondary Pressed Label
        case secondaryPressed
        /// Secondary Disabled
        case secondaryDisabled
        /// Custom Text
        case custom(LocalizedStringKey)
        /// Custom Pressed Text
        case customPressed(LocalizedStringKey)

        var value: LocalizedStringKey {
            switch self {
            case .primaryDefault:
                return LocalizationKeys.primaryDefault

            case .primaryPressed:
                return LocalizationKeys.primaryPressed

            case .primaryDisabled:
                return LocalizationKeys.primaryDisabled

            case .secondaryDefault:
                return LocalizationKeys.secondaryDefault

            case .secondaryPressed:
                return LocalizationKeys.secondaryPressed

            case .secondaryDisabled:
                return LocalizationKeys.secondaryDisabled

            case .custom(let customLabel):
                return customLabel

            case .customPressed(let customPressed):
                return customPressed
            }
        }
    }

    /// Defines font options for the Brand Button.
    enum Font {
        case defaultFont
        case custom(String)

        var value: String {
            switch self {
            case .defaultFont:
                return LocalizationKeys.defaultFont
            case .custom(let fontName):
                return fontName
            }
        }
    }
}

extension BaseButtonStyle {

    static func setColorIfButtonPressed(
        from selectedBackground: Colors,
        for selectedOption: Variant,
        customColor: Colors) -> Color {

        switch (selectedBackground, selectedOption) {
            case (.green, .primary):
                return Colors.darkGreen.value

            case (.blue, .primary):
                return Colors.darkBlue.value

            case (.blue, .secondary):
                return Colors.lightBlue.value

            case (.green, .secondary):
                return Colors.lightGreen.value

            case (_, .custom):
                return customColor.value

            default:
                return Colors.white.value
        }
    }
    /// MARK: - Use this function if you want to set Image for the BrandButton
    static func setIcon(
        customIcon: Image? = nil,
        selectedOption: Variant,
        isIconEnabled: Bool,
        isButtonEnabled: Bool) -> Image? {

        var icon: Image?

            if selectedOption == .custom && customIcon != nil {
                icon = customIcon
            } else if selectedOption == .primary {
                if let primaryIcon = UIImage(named: LocalizationKeys.primaryIcon) {
                    icon = isIconEnabled ? Image(uiImage: primaryIcon) : nil
                }
            } else if selectedOption == .secondary && !isButtonEnabled {
                if let disabledIcon = UIImage(named: LocalizationKeys.disabledIcon) {
                    icon = isIconEnabled ? Image(uiImage: disabledIcon) : nil
                }
            } else if selectedOption == .secondary {
                if let secondaryIcon = UIImage(named: LocalizationKeys.secondaryIcon) {
                    icon = isIconEnabled ? Image(uiImage: secondaryIcon) : nil
                }
            }

        return icon
    }
        /// Returns the background color set for a given button variant.
        /// - Parameter selectedOption: The variant of the button.
        /// - Returns: An array of `Colors` associated with the variant.
    static func setBackgroundColor(for selectedOption: Variant) -> [Colors] {
            switch selectedOption {
            case .primary, .secondary:
                /// For primary and secondary, a predefined set of colors is used.
                return [.green, .blue]
            case .custom:
                /// The custom variant allows for a broader range of colors.
                return [
                    .black,
                    .blue,
                    .green,
                    .orange,
                    .pink,
                    .cyan,
                    .brown
                ]
            }
    }
    /// Determines the label color based on the button's background color, variant, and enabled state.
    /// - Parameters:
    ///   - selectedBackground: The background color of the button.
    ///   - selectedOption: The variant of the button.
    ///   - customColor: The Color for custom button
    ///   - isButtonEnabled: A Boolean value indicating whether the button is enabled.
    /// - Returns: The appropriate color for the button's label.
   static func setLabelColor(
        from selectedBackground: Colors,
        for selectedOption: Variant,
        customColor: Colors,
        isButtonEnabled: Bool) -> Colors {

        if !isButtonEnabled && selectedOption == .primary {
            return .white
        } else if !isButtonEnabled && selectedOption == .secondary {
            return .gray
        }

        switch (selectedBackground, selectedOption) {
        case (.green, .secondary):
            return .darkGreen

        case (.blue, .secondary):
            return .darkBlue

        case (_, .custom):
            return customColor

        default:
            return .white
        }
    }
    /// MARK: - Use this function if you wanna to set Label for BrandButton
    static func setLabel(
        for selectedOption: Variant,
        isPressed: Bool,
        isDisabled: Bool,
        customText: LocalizedStringKey,
        customPressedText: LocalizedStringKey) -> Label {
            switch selectedOption {
            case .primary:
                if isDisabled {
                    return .primaryDisabled
                }
                return isPressed ? .primaryPressed : .primaryDefault

            case .secondary:
                if isDisabled {
                    return .secondaryDisabled
                }
                return isPressed ? .secondaryPressed : .secondaryDefault

            case .custom:
                return isPressed ? .customPressed(customPressedText) : .custom(customText)
            }
    }
}
