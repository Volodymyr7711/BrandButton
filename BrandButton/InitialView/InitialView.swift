//
//  InitialView.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 03/03/2024.
//

import SwiftUI

struct InitialView: View {
    // MARK: - Properties
    @State var showSplash = true
    // MARK: - Body
    var body: some View {
        NavigationStack {
            if showSplash {
                SplashView()
            } else {
                HomeView(viewModel: HomeViewModel())
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.spring(.smooth)) {
                    self.showSplash = false
                }
            }
        }
    }
}

#Preview {
    InitialView()
}
