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
    public enum Feature {
        case plain([UIOnboardingFeature])
        case checkBox([UIOnboardingFeatureCheckBox])
    }

    // MARK: - Properties
    public var appIcon: String
    public var firstTitleLine: String
    public var secondTitleLine: String
    public var features: [Feature]
    public var bottomBar: UIOnboardingBottomBarConfiguration
    public var defaultSelection: IndexPath

    // MARK: - Init
    public init(
        appIcon: String,
        firstTitleLine: String,
        secondTitleLine: String,
        features: [Feature],
        bottomBar: UIOnboardingBottomBarConfiguration,
        defaultSelection: IndexPath = .init(row: 0, section: 0)
    ) {
        self.appIcon = appIcon
        self.firstTitleLine = firstTitleLine
        self.secondTitleLine = secondTitleLine
        self.features = features
        self.bottomBar = bottomBar
        self.defaultSelection = defaultSelection
    }
}

extension UIOnboardingViewConfiguration.Feature: Identifiable {
    public var id: UUID {
        switch self {
            case .plain(let onboardingFeatures):
                return onboardingFeatures.first?.id ?? UUID()
            case .checkBox(let checkBoxFeatures):
                return checkBoxFeatures.first?.id ?? UUID()
        }
    }
}
