//
//  UIOnboardingCheckInBox.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 04.02.2024.
//

import SwiftUI

public struct UIOnboardingFeatureCheckBox: Identifiable {
    public let id = UUID()
    let icon: UIImage
    let iconTint: Color
    let title: String
    var selected: Bool?

    public init(
        icon: UIImage,
        iconTint: Color = Color(UIColor.label),
        title: String,
        selected: Bool = false
    ) {
        self.icon = icon
        self.iconTint = iconTint
        self.title = title
        self.selected = selected
    }
}
