//
//  SplashView.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 01/03/2024.
//

import SwiftUI

struct SplashView: View {
    // MARK: - Body
    var body: some View {
        HStack {
            withAnimation(.easeIn(duration: 1.5)) {
                LinearBackgroundView(duration: 5)
                    .cornerRadius(0, antialiased: true)
                    .shadow(radius: 5)
                    .mask {
                        HStack {
                            Text("Brand Button")
                                .multilineTextAlignment(.center)
                                .font(
                                    .system(
                                        size: 35,
                                        weight: .heavy,
                                        design: .rounded
                                    )
                                )
                        }
                    }
            }
        }
        .environment(\.colorScheme, .light)
    }
}

#Preview {
    SplashView()
}
