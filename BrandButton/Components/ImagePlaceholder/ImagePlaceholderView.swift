//
//  ImagePlaceholderView.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 03/03/2024.
//

import SwiftUI

struct ImagePlaceholderView: View {
    // MARK: - Properties
    public let image: Image
    public let width: CGFloat
    public let height: CGFloat

    // MARK: - Body
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
    }
}
