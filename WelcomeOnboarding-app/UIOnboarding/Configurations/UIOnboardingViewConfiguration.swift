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
        case plain(UIOnboardingFeature)
        case checkBox(UIOnboardingFeatureCheckBox)
    }

    // MARK: - Properties
    public let appIcon: UIImage
    public let firstTitleLine: String
    public let secondTitleLine: String
    public let features: [Feature]
    public let bottomBar: UIOnboardingBottomBarConfiguration
    public let defaultSelection: IndexPath

    // MARK: - Init
    public init(
        appIcon: UIImage,
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
