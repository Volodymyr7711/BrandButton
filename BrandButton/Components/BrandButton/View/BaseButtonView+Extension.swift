//
//  BaseButtonView+Extension.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 01/03/2024.
//

import SwiftUI

extension BrandButtonView {
    /// Modifies the button's label based on its current state and provided custom text.
    /// This method utilizes the BaseButtonStyle utility to select the appropriate label,
    /// considering the button's variant, pressed state, and enabled state.
    ///
    /// - Parameter customText: The custom text or localization key provided for the button's label.
    /// - Returns: A LocalizedStringKey representing the modified label based on the button's state and styling rules.
    func setLabel(customText: LocalizedStringKey, customPressedText: LocalizedStringKey) -> LocalizedStringKey {
        BaseButtonStyle
            .setLabel(
                for: variant,
                isPressed: isPressed,
                isDisabled: !isEnabled,
                customText: customText,
                customPressedText: customPressedText
            ).value
    }
}
