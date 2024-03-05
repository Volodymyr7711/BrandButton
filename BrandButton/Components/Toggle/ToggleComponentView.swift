//
//  ToggleComponentView.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 01/03/2024.
//

import SwiftUI

struct ToggleComponentView: View {
    // MARK: - Properties
    @Binding var isOn: Bool
    let label: LocalizedStringKey

    public var body: some View {
        Toggle(isOn: $isOn.animation(.default), label: { Text(label) })
    }
}
