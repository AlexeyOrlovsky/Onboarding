//
//  UIOnboardingFeature.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

public struct UIOnboardingFeature: Identifiable {
    public let id = UUID()
    var icon: UIImage
    var iconTint: Color
    var title: String
    var description: String

    public init(
        icon: UIImage,
        iconTint: Color = .init(uiColor: UIColor.label),
        title: String,
        description: String
    ) {
        self.icon = icon
        self.iconTint = iconTint
        self.title = title
        self.description = description
    }
}
