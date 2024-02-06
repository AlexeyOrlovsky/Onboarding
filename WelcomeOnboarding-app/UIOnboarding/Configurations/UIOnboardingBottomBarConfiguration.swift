//
//  UIOnboardingBottomBarConfiguration.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

public struct UIOnboardingBottomBarConfiguration {
    let icon: String
    let subtitle: String
    let buttonText: String

    public init(
        icon: String,
        subtitle: String,
        buttonText: String
    ) {
        self.icon = icon
        self.subtitle = subtitle
        self.buttonText = buttonText
    }
}
