//
//  BrandButtonViewBuilder.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 04/03/2024.
//

import SwiftUI

final class BrandButtonViewBuilder {
    // MARK: - Properties
    private var label: LocalizedStringKey?
    private var textColor: Color?
    private var fontSize: CGFloat?
    private var fontName: BaseButtonStyle.Font?
    private var backgroundColor: Color?
    private var pressedColor: Color?
    private var pressedLabel: LocalizedStringKey?
    private var variant: Binding<BaseButtonStyle.Variant>?
    private var isPressed: Binding<Bool>?
    private var leadingIcon: Image?
    private var trailingIcon: Image?
    private var isFullWidthEnabled: Bool?
    private var isButtonEnabled: Bool?
    private var size: BaseButtonStyle.Size?

    func setLabel(label: LocalizedStringKey?) -> Self {
        self.label = label

        return self
    }

    func setTextColor(textColor: Color?) -> Self {
        self.textColor = textColor

        return self
    }

    func setFontSize(fontSize: CGFloat?) -> Self {
        self.fontSize = fontSize

        return self
    }

    func setFont(fontName: BaseButtonStyle.Font?) -> Self {
        self.fontName = fontName

        return self
    }

    func setBackgroundColor(backgroundColor: Color?) -> Self {
        self.backgroundColor = backgroundColor

        return self
    }

    func setPressedColor(pressedColor: Color?) -> Self {
        self.pressedColor = pressedColor

        return self
    }

    func setPressedLabel(pressedLabel: LocalizedStringKey?) -> Self {
        self.pressedLabel = pressedLabel

        return self
    }

    func setVariant(variant: Binding<BaseButtonStyle.Variant>?) -> Self {
        self.variant = variant

        return self
    }

    func setButtonState(isPressed: Binding<Bool>?) -> Self {
        self.isPressed = isPressed

        return self
    }

    func setLeadingIcon(leadingIcon: Image?) -> Self {
        self.leadingIcon = leadingIcon

        return self
    }

    func setTrailingIcon(trailingIcon: Image?) -> Self {
        self.trailingIcon = trailingIcon

        return self
    }

    func setFullWidth(isFullWidthEnabled: Bool?) -> Self {
        self.isFullWidthEnabled = isFullWidthEnabled

        return self
    }

    func setButtonState(isButtonEnabled: Bool?) -> Self {
        self.isButtonEnabled = isButtonEnabled

        return self
    }

    func setSize(_ size: BaseButtonStyle.Size) -> Self {
        self.size = size

        return self
    }

    func build() -> BrandButtonView {
        return BrandButtonView(
            label: label ?? LocalizedStringKey("Custom"),
            textColor: textColor ?? .white,
            fontSize: fontSize ?? 15.0,
            fontName: fontName ?? .defaultFont,
            backgroundColor: backgroundColor ?? .green,
            pressedColor: pressedColor ?? .green,
            pressedLabel: pressedLabel ?? LocalizedStringKey("Custom Pressed"),
            variant: variant ?? .constant(.primary),
            leadingIcon: leadingIcon ?? nil,
            trailingIcon: trailingIcon ?? nil,
            isFullWidthEnabled: isFullWidthEnabled ?? false,
            isEnabled: isButtonEnabled ?? false,
            size: size ?? .regular)
    }
}
