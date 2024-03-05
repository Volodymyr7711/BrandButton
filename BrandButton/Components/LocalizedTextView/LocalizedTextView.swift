//
//  LocalizedTextView.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 03/03/2024.
//

import SwiftUI

struct LocalizedTextView: View {
    // MARK: - Properties
    public let localizedKey: String

    var body: some View {
        Text(LocalizedStringKey(localizedKey))
    }
}
