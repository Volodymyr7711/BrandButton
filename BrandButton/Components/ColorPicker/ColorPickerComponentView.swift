//
//  ColorPickerComponent.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 01/03/2024.
//

import SwiftUI

struct ColorPickerComponentView: View {
    // MARK: - Properties
    @State var colors: [BaseButtonStyle.Colors]
    @Binding var selectedColor: BaseButtonStyle.Colors

    init(
        colors: [BaseButtonStyle.Colors],
        selectedColor: Binding<BaseButtonStyle.Colors>) {
        self.colors = colors
        self._selectedColor = selectedColor
    }
    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach($colors, id: \.self) { $color in
                    color
                        .value
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(lineWidth: selectedColor.value == color.value ? 4 : 0)
                        )
                        .onTapGesture {
                            withAnimation(.default) {
                                selectedColor = color
                            }
                        }
                }
            }
            .padding([.top, .bottom, .leading], 10)
        }
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ColorPickerComponentView(
        colors: [.red, .green, .blue, .yellow, .cyan],
        selectedColor: .constant(.red)
    )
    .frame(maxWidth: .infinity)
}
