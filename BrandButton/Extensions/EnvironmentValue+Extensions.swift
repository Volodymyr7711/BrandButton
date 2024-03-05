//
//  EnvironmentValue+Extensions.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 01/03/2024.
//

import SwiftUI

private struct BrandButtonStyleEnvironmentKey: EnvironmentKey {
    static let defaultValue = BrandButtonView.Style()
}

extension EnvironmentValues {

    var brandButtonStyle: BrandButtonView.Style {
        get { self[BrandButtonStyleEnvironmentKey.self] }
        set { self[BrandButtonStyleEnvironmentKey.self] = newValue }
    }
}
