//
//  UIViewController+Extensions.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 05/03/2024.
//

import UIKit
import SwiftUI

extension UIViewController {

    func present(
        contentView: some View,
        animated: Bool,
        presentationStyle: UIModalPresentationStyle = .automatic) {

            let hosting = UIHostingController(rootView: contentView)
            hosting.modalPresentationStyle = presentationStyle
            hosting.preferredContentSize = hosting.sizeThatFits(in: view.frame.size)

            self.present(hosting, animated: animated)
        }
}
