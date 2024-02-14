//
//  UIOnboardingViewConfiguration.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

// MARK: - UIOnboardingViewConfiguration
public struct UIOnboardingViewConfiguration {
    // MARK: - Feature
    public enum Feature: Identifiable {
        case plain(UIOnboardingFeature)
        case checkBox(UIOnboardingFeatureCheckBox)

        public var id: UUID {
            switch self {
                case .plain(let onboardingFeatures):
                    return onboardingFeatures.id
                case .checkBox(let checkBoxFeatures):
                    return checkBoxFeatures.id
            }
        }
    }

    // MARK: - Properties
    public let appIcon: UIImage
    public let firstTitleLine: String
    public let secondTitleLine: String
    public let features: [Feature]
    public let bottomBar: UIOnboardingBottomBarConfiguration

    // MARK: - Init
    public init(
        appIcon: UIImage,
        firstTitleLine: String,
        secondTitleLine: String,
        features: [Feature],
        bottomBar: UIOnboardingBottomBarConfiguration
    ) {
        self.appIcon = appIcon
        self.firstTitleLine = firstTitleLine
        self.secondTitleLine = secondTitleLine
        self.features = features
        self.bottomBar = bottomBar
    }
}
