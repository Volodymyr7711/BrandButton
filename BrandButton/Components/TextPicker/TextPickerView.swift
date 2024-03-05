//
//  TextPickerView.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 03/03/2024.
//

import SwiftUI

struct TextPickerView: View {
    // MARK: - Properties
    public let options: [BaseButtonStyle.Variant]
    @Binding var selectedOption: BaseButtonStyle.Variant

    // MARK: - Initializer
    init(options: [BaseButtonStyle.Variant], selectedOption: Binding<BaseButtonStyle.Variant>) {
        self.options = options
        self._selectedOption = selectedOption
    }

    // MARK: - Body
    var body: some View {
        Picker("", selection: $selectedOption.animation(.default)) {
            ForEach(options, id: \.self) { option in
                Text(option.rawValue)
                    .tag(option)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TextPickerView(
        options: [.primary, .secondary, .custom],
        selectedOption: .constant(.primary))
}
