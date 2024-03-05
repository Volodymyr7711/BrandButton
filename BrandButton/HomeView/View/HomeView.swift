//
//  ContentView.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 01/03/2024.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @StateObject var viewModel: HomeViewModel

    // MARK: - Body
    var body: some View {
        NavigationStack {
            Form {
                /// Section gives us possibility to choose which type
                /// of variant should be applied
                Section(header: LocalizedTextView(localizedKey: LocalizationKeys.chooseButtonType)) {

                        TextPickerView(
                            options: viewModel.options,
                            selectedOption: $viewModel.selectedOption
                        )
                }

                switch viewModel.selectedOption {
                case .primary:
                    /// Section gives us possibility to choose background color for primary button type
                    Section(header: LocalizedTextView(localizedKey: LocalizationKeys.modifyBackgroundColor)) {

                        createColorPickerView(
                            colors: setBackground(variant: .primary),
                            selectedColor: $viewModel.selectedBackgroundColor
                        )
                        .transition(.slide)
                        .animation(.easeInOut, value: viewModel.selectedOption)
                    }

                case .secondary:
                    /// Section gives us possibility to choose background color for secondary type
                    Section(header: LocalizedTextView(localizedKey: LocalizationKeys.modifyBackgroundColor)) {

                        createColorPickerView(
                            colors: setBackground(variant: .secondary),
                            selectedColor: $viewModel.selectedBackgroundColor
                        )
                        .transition(.slide)
                        .animation(.easeInOut, value: viewModel.selectedOption)
                    }

                case .custom:
                    /// Section gives us possibility to choose background color for custom type
                    Section(header: LocalizedTextView(localizedKey: LocalizationKeys.modifyBackgroundColor)) {

                        createColorPickerView(
                            colors: setBackground(variant: .custom),
                            selectedColor: $viewModel.selectedBackgroundColor
                        )
                        .transition(.slide)
                        .animation(.easeInOut, value: viewModel.selectedOption)
                    }
                    /// Section gives us possibility to choose label color
                    Section(header: LocalizedTextView(localizedKey: LocalizationKeys.modifyTextColor)) {

                        createColorPickerView(
                            colors: viewModel.textColors,
                            selectedColor: $viewModel.selectedTextColor
                        )
                        .transition(.slide)
                        .animation(.easeInOut, value: viewModel.selectedOption)
                    }
                }
                /// Section gives us possibility to modify text size
                Section(header: LocalizedTextView(localizedKey: LocalizationKeys.modifyTextSize)) {
                    SliderView(
                        value: $viewModel.sliderValue,
                        range: viewModel.range,
                        minimumValueLabel: LocalizationKeys.minimumValue,
                        maximumValueLabel: LocalizationKeys.maximumValue)
                }
                /// Section gives us possibility to modify Brand Button parameters
                /// using toggle values
                Section(header: LocalizedTextView(localizedKey: LocalizationKeys.modifyButton)) {

                    createToggleComponentView(
                        isOn: $viewModel.isLeadingIconEnabled,
                        label: LocalizationKeys.addLeadingIcon)

                    createToggleComponentView(
                        isOn: $viewModel.isTrailingIconEnabled,
                        label: LocalizationKeys.addTrailingIcon)

                    createToggleComponentView(
                        isOn: $viewModel.isFullscreenEnabled,
                        label: LocalizationKeys.fullscreenWidth)

                    createToggleComponentView(
                        isOn: $viewModel.isButtonEnabled,
                        label: LocalizationKeys.enableButton)
                }
            }
            .navigationTitle(Text(LocalizationKeys.appName))
            .navigationBarTitleDisplayMode(.large)

            createBrandButtonView(
                textColor: setTextColor(),
                fontSize: viewModel.sliderValue,
                fontName: .defaultFont,
                backgroundColor: viewModel.selectedBackgroundColor.value,
                pressedColor: setColorIfButtonPressed(),
                variant: $viewModel.selectedOption,
                leadingIcon: setIconIfRequired(
                    nil, viewModel.isLeadingIconEnabled),
                trailingIcon: setIconIfRequired(
                    nil, viewModel.isTrailingIconEnabled),
                isFullWidthEnabled: viewModel.isFullscreenEnabled,
                isEnabled: viewModel.isButtonEnabled,
                size: .regular
            )
            .padding()
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
