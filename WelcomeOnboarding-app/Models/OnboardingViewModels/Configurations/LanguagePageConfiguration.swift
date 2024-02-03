//
//  LanguagePageConfiguration.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 03.02.2024.
//

import SwiftUI

private typealias WelcomeOnboarding = UIOnboardingViewConfiguration.Onboarding

extension WelcomeOnboarding {
    static func languagesPage() -> UIOnboardingViewConfiguration {
        .init(
            appIcon: LanguagePageConfiguration.setUpIcon(),
            firstTitleLine: LanguagePageConfiguration.setUpFirstTitleLine(),
            secondTitleLine: LanguagePageConfiguration.setUpSecondTitleLine(),
            features: LanguagePageConfiguration.setUpFeatures(),
            bottomBar: LanguagePageConfiguration.setUpBottomBar()
        )
    }

    // MARK: - OnboardingViewRepresentable UIOnboardingHelper
    private struct LanguagePageConfiguration: UIOnboardingConfiguratable {
        static func setUpIcon() -> String {
            let iconName = "" // 🏳️
            return iconName
        }

        static func setUpFirstTitleLine() -> String {
            let iconName = "Choose language to start"
            return iconName
        }

        static func setUpSecondTitleLine() -> String {
            let iconName = "" // 🏳️
            return iconName
        }

        static func setUpFeatures() -> [UIOnboardingFeature] {
            [
                .init(
                    icon: "englandLangIcon",
                    title: "English",
                    description: ""
                ),
                .init(
                    icon: "germanyLangIcon",
                    title: "Germany",
                    description: ""
                ),
                .init(
                    icon: "italyLangIcon",
                    title: "Italian",
                    description: ""
                ),
                .init(icon: "sloveniaLangIcon",
                      title: "Slovenian",
                      description: ""
                     )
            ]
        }

        static func setUpBottomBar() -> UIOnboardingBottomBarConfiguration {
            .init(
                icon: "globe",
                subtitle: "Developed and designed for LOT TOV",
                buttonText: "Continue"
            )
        }
    }
}
