//
//  SliderView.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 04/03/2024.
//

import SwiftUI

struct SliderView: View {
    // MARK: - Properties
    let value: Binding<CGFloat>
    let range: ClosedRange<CGFloat>
    let minimumValueLabel: LocalizedStringKey
    let maximumValueLabel: LocalizedStringKey

    // MARK: - Initializer
    init(
        value: Binding<CGFloat>,
        range: ClosedRange<CGFloat>,
        minimumValueLabel: LocalizedStringKey,
        maximumValueLabel: LocalizedStringKey) {

        self.value = value
        self.range = range
        self.minimumValueLabel = minimumValueLabel
        self.maximumValueLabel = maximumValueLabel
    }

    var body: some View {
        Slider(value: value, in: range){}
        minimumValueLabel: {
            Text(minimumValueLabel)
        } maximumValueLabel: {
            Text(maximumValueLabel)
        }
    }
}

#Preview {
    SliderView(
        value: .constant(19),
        range: 15...25,
        minimumValueLabel: "15",
        maximumValueLabel: "25")
}
