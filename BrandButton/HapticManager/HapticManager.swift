//
//  HapticManager.swift
//  BrandButton
//
//  Created by Volodymyr Mendyk on 03/03/2024.
//

import Foundation
import UIKit

class HapticManager {

    private init() {}

    public static func notification(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }

    public static  func impact(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
