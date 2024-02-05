//
//  UIOnboardingBottomBarConfiguration.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

public struct UIOnboardingBottomBarConfiguration {
    var icon: String
    var subtitle: String
    var buttonText: String

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
