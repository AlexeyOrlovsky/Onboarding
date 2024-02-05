//
//  UIOnboardingConfiguratable.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

// MARK: - UIOnboardingConfiguratable
protocol UIOnboardingConfiguratable {
    static func setUpIcon() -> UIImage
    static func setUpFirstTitleLine() -> String
    static func setUpSecondTitleLine() -> String
    static func setUpFeatures() -> [UIOnboardingViewConfiguration.Feature]
    static func setUpBottomBar() -> UIOnboardingBottomBarConfiguration
}

// MARK: - WelcomeOnboarding
extension UIOnboardingViewConfiguration {
    enum Onboarding { }
}
