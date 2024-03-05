//
//  ToggleComponentBuilder.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 03/03/2024.
//

import Foundation
import SwiftUI

final class ToggleComponentBuilder {
    // MARK: - Properties
    private var isOn: Binding<Bool>?
    private var label: LocalizedStringKey?

    func set(isOn: Binding<Bool>?) -> Self {
        self.isOn = isOn

        return self
    }

    func set(label: LocalizedStringKey?) -> Self {
        self.label = label

        return self
    }

    func build() -> ToggleComponentView {
        return ToggleComponentView(
            isOn: isOn ?? .constant(false),
            label: label ?? "")
    }
}
