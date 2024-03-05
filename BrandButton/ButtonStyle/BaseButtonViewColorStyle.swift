//
//  BaseButtonViewColorStyle.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 01/03/2024.
//

import Foundation
import SwiftUI

struct BaseButtonViewColorStyle: ButtonStyle {
    // MARK: Properties
    public let backgroundColor: Color
    public let pressedColor: Color
    public let isEnabled: Bool
    public let isPressed: Bool
    public let variant: BaseButtonStyle.Variant
    let disabledColor: Color = Color(hex: "#9BA2A6")

    func makeBody(configuration: Configuration) -> some View {
        switch variant {
        case .primary:
            configuration.label
                .animation(.interpolatingSpring(.snappy), value: configuration.isPressed)
                .background(isPressed ? pressedColor : (isEnabled ? backgroundColor : disabledColor))
                .clipShape(.buttonBorder)

        case .secondary:
            configuration.label
                .animation(.interpolatingSpring(.snappy), value: configuration.isPressed)
                .background(isPressed ? pressedColor : (isEnabled ? Color.clear : Color.clear))
                .border(isEnabled ? backgroundColor : disabledColor, width: 1)
                .clipShape(RoundedRectangle(cornerRadius: 2.0))

        case .custom:
            configuration.label
                .animation(.interpolatingSpring(.snappy), value: configuration.isPressed)
                .background(isPressed ? pressedColor : (isEnabled ? backgroundColor : disabledColor))
                .clipShape(.buttonBorder)
        }
    }
}
