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
        // case checkBox(UIOnboardingFeatureCheckBox)
    }

    // MARK: - TableSelectingType
    public enum TableSelectingType {
        case single
        case multiple
    }

    // MARK: - Properties
    public var appIcon: String
    public var firstTitleLine: String
    public var secondTitleLine: String
    // public var features: [Feature] // 🏳️
    public var features: [UIOnboardingFeature]
    public var bottomBar: UIOnboardingBottomBarConfiguration
    public var defaultSelection: IndexPath
    public var selectingType: TableSelectingType

    // MARK: - Init
    public init(
        appIcon: String,
        firstTitleLine: String,
        secondTitleLine: String,
        features: [UIOnboardingFeature],
        bottomBar: UIOnboardingBottomBarConfiguration,
        defaultSelection: IndexPath = .init(row: 0, section: 0),
        selectingType: TableSelectingType = .single
    ) {
        self.appIcon = appIcon
        self.firstTitleLine = firstTitleLine
        self.secondTitleLine = secondTitleLine
        self.features = features
        self.bottomBar = bottomBar
        self.defaultSelection = defaultSelection
        self.selectingType = selectingType
    }
}
