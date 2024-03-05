//
//  HomeView+Extensions.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 04/03/2024.
//

import SwiftUI

extension HomeView {
    /// Use createToggleComponentView function to create Toggle component
    func createToggleComponentView(isOn: Binding<Bool>, label: LocalizedStringKey) -> ToggleComponentView {
        let toggleComponentView = ToggleComponentBuilder()
            .set(isOn: isOn)
            .set(label: label)
            .build()

        return toggleComponentView
    }
    /// Use createColorPickerView function to create ColorPicker component
    func createColorPickerView(colors: [BaseButtonStyle.Colors], selectedColor: Binding<BaseButtonStyle.Colors>) -> ColorPickerComponentView {

        let colorPickerComponentView = ColorPickerComponentBuilder()
            .set(colors: colors)
            .set(selectedColor: selectedColor)
            .build()

        return colorPickerComponentView
    }

    func createBrandButtonView(
        label: LocalizedStringKey = LocalizedStringKey("Custom"),
        textColor: Color,
        fontSize: CGFloat,
        fontName: BaseButtonStyle.Font,
        backgroundColor: Color,
        pressedColor: Color,
        pressedLabel: LocalizedStringKey = LocalizedStringKey("Custom Pressed"),
        variant: Binding<BaseButtonStyle.Variant>,
        leadingIcon: Image?,
        trailingIcon: Image?,
        isFullWidthEnabled: Bool,
        isEnabled: Bool,
        size: BaseButtonStyle.Size) -> BrandButtonView {

        let brandButtonView = BrandButtonViewBuilder()
            .setLabel(label: label)
            .setTextColor(textColor: textColor)
            .setFontSize(fontSize: fontSize)
            .setFont(fontName: fontName)
            .setBackgroundColor(backgroundColor: backgroundColor)
            .setPressedColor(pressedColor: pressedColor)
            .setPressedLabel(pressedLabel: pressedLabel)
            .setVariant(variant: variant)
            .setLeadingIcon(leadingIcon: leadingIcon)
            .setTrailingIcon(trailingIcon: trailingIcon)
            .setFullWidth(isFullWidthEnabled: isFullWidthEnabled)
            .setButtonState(isButtonEnabled: isEnabled)
            .setSize(size)
            .build()

        return brandButtonView
    }
}

extension HomeView {

    func setTextColor() -> Color {

        return BaseButtonStyle
            .setLabelColor(
                from: viewModel.selectedBackgroundColor,
                for: viewModel.selectedOption,
                customColor: viewModel.selectedTextColor,
                isButtonEnabled: viewModel.isButtonEnabled)
            .value
    }

    func setColorIfButtonPressed() -> Color {

        return BaseButtonStyle
            .setColorIfButtonPressed(
                from: viewModel.selectedBackgroundColor,
                for: viewModel.selectedOption,
                customColor: viewModel.selectedBackgroundColor)
    }

    func setIconIfRequired(_ customIcon: Image?, _ isEnabled: Bool) -> Image? {

        return BaseButtonStyle
            .setIcon(
                    customIcon: customIcon,
                    selectedOption: viewModel.selectedOption,
                    isIconEnabled: isEnabled,
                    isButtonEnabled: viewModel.isButtonEnabled)
    }

    func setBackground(variant: BaseButtonStyle.Variant) -> [BaseButtonStyle.Colors] {

        return BaseButtonStyle
            .setBackgroundColor(for: variant)
    }

    func setLabel(
        isPressed: Bool,
        customText: LocalizedStringKey,
        customPressedText: LocalizedStringKey) -> BaseButtonStyle.Label {

        return BaseButtonStyle
            .setLabel(
                for: viewModel.selectedOption,
                isPressed: isPressed,
                isDisabled: viewModel.isButtonEnabled,
                customText: customText,
                customPressedText: customPressedText)
    }
}
