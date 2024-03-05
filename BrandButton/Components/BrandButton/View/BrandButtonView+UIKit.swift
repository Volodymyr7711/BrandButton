//
//  BrandButtonView + UIKit.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 05/03/2024.
//

import SwiftUI
import UIKit

public final class HomeViewController: UIViewController {

    public override func viewWillAppear(_ animated: Bool) {
        presentButtonView()
    }

    func presentButtonView() {

        let brandButtonView = BrandButtonView(
            label: "Custom Text",
            fontSize: 18,
            backgroundColor: .green,
            pressedColor: .red,
            pressedLabel: "Custom Pressed",
            variant: .constant(.custom)
        )

        present(contentView: brandButtonView, animated: true)
    }
}

#Preview {
    HomeViewController()
}
