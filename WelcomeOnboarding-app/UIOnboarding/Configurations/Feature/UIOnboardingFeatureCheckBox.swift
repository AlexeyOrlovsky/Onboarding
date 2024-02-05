//
//  UIOnboardingCheckInBox.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 04.02.2024.
//

import SwiftUI

public struct UIOnboardingFeatureCheckBox: Identifiable {
    public let id = UUID()
    var icon: String
    var iconTint: Color
    var title: String
    var description: String
    var selected: Bool

    public init(icon: String,
                iconTint: Color = Color(UIColor.label),
                title: String,
                description: String,
                selected: Bool = false
    ) {
        self.icon = icon
        self.iconTint = iconTint
        self.title = title
        self.description = description
        self.selected = selected
    }
}
