//
//  ColorPickerComponentBuilder.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 04/03/2024.
//

import SwiftUI

final class ColorPickerComponentBuilder {
    // MARK: - Properties
    private var colors: [BaseButtonStyle.Colors]?
    private var selectedColor: Binding<BaseButtonStyle.Colors>?

    func set(colors: [BaseButtonStyle.Colors]?) -> Self {
        self.colors = colors

        return self
    }

    func set(selectedColor: Binding<BaseButtonStyle.Colors>?) -> Self {
        self.selectedColor = selectedColor

        return self
    }

    func build() -> ColorPickerComponentView {
        return ColorPickerComponentView(
            colors: colors ?? [.brown, .blue, .orange, .cyan, .green],
            selectedColor: selectedColor ?? .constant(.green))
    }
}
