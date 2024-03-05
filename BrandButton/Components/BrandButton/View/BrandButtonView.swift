//
//  BaseButton.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 01/03/2024.
//

import SwiftUI

public struct BrandButtonView: View {
    // MARK: - Properties
    /// The environment-specific style configuration for the brand button.
    @Environment(\.brandButtonStyle) var style
    /// The text label for the button. Supports localization.
    let label: LocalizedStringKey
    /// The color of the text label.
    let textColor: Color
    /// The font size of the text label.
    let fontSize: CGFloat
    /// The font name for the text label, defined within BaseButtonStyle.Font.
    let fontName: BaseButtonStyle.Font
    /// The background color of the button in its normal state.
    let backgroundColor: Color
    /// The background color of the button when it is pressed.
    let pressedColor: Color

    let pressedLabel: LocalizedStringKey
    /// A binding to the variant of the button, which may affect its styling.
    @Binding var variant: BaseButtonStyle.Variant
    /// State to manage the pressed status of the button, to change styling dynamically.
    @State var isPressed: Bool = false
    /// An optional image to display as a leading icon in the button.
    let leadingIcon: Image?
    /// An optional image to display as a trailing icon in the button.
    let trailingIcon: Image?
    /// A flag to enable the button to expand to the full width of its container.
    let isFullWidthEnabled: Bool
    /// The size of the button, defined within BaseButtonStyle.Size, may affect padding and spacing.
    let size: BaseButtonStyle.Size
    /// Determines if the button is interactable (enabled) or not.
    let isEnabled: Bool

    // MARK: - Initializer
    init(
        label: LocalizedStringKey = LocalizedStringKey("Custom"),
        textColor: Color = .white,
        fontSize: CGFloat = 15.0,
        fontName: BaseButtonStyle.Font = .defaultFont,
        backgroundColor: Color = .green,
        pressedColor: Color = .green,
        pressedLabel: LocalizedStringKey = LocalizedStringKey("Custom Pressed"),
        variant: Binding<BaseButtonStyle.Variant>,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        isFullWidthEnabled: Bool = false,
        isEnabled: Bool = true,
        size: BaseButtonStyle.Size = .regular) {
        self.label = label
        self.textColor = textColor
        self.fontSize = fontSize
        self.fontName = fontName
        self.backgroundColor = backgroundColor
        self.pressedColor = pressedColor
        self.pressedLabel = pressedLabel
        self._variant = variant
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.isFullWidthEnabled = isFullWidthEnabled
        self.isEnabled = isEnabled
        self.size = size
    }

    // MARK: - Body
    public var body: some View {
        HStack {
            Button(action: {
                isPressed.toggle()
                HapticManager.impact(.medium)
            }, label: {
                HStack {
                    if let leadingIcon {
                        ImagePlaceholderView(
                            image: leadingIcon,
                            width: style.imagePlaceholderWidth,
                            height: style.imagePlaceholderHeight
                        )
                        .padding(.leading, 16)
                        .padding(.trailing, -12)
                    }

                    Text(
                        setLabel(
                            customText: label,
                            customPressedText: pressedLabel)
                    )
                    .foregroundStyle(textColor)
                    .font(.custom(fontName.value, size: fontSize))
                    .padding([.top, .bottom], style.labelTopAndBottomConstraint)
                    .padding([.leading, .trailing], style.labelLeadingAndTrailingConstraint)

                    if let trailingIcon {
                        ImagePlaceholderView(
                            image: trailingIcon,
                            width: style.imagePlaceholderWidth,
                            height: style.imagePlaceholderHeight
                        )
                        .padding(.leading, -12)
                        .padding(.trailing, 16)
                    }
                }
                .frame(
                    height: style.buttonHeight,
                    alignment: .center
                )
                .frame(
                    minWidth: style.minButtonWidth,
                    maxWidth: isFullWidthEnabled ? .infinity : nil)
            })
            .buttonStyle(
                BaseButtonViewColorStyle(
                    backgroundColor: backgroundColor,
                    pressedColor: pressedColor,
                    isEnabled: isEnabled,
                    isPressed: isPressed,
                    variant: variant
                )
            )
            .disabled(!isEnabled)
        }
    }
}

// MARK: - Preview
#Preview {
    BrandButtonView(
        variant: .constant(.primary),
        leadingIcon: nil,
        trailingIcon: Image(uiImage: UIImage(named: "Placeholder")!),
        isFullWidthEnabled: false,
        size: .regular)
}
