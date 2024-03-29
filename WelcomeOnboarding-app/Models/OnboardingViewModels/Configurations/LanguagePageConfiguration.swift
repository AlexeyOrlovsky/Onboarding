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

    // MARK: - Content
    private struct LanguagePageConfiguration: UIOnboardingConfiguratable {
        static func setUpIcon() -> UIImage {
            let iconName = UIImage(named: "") ?? .init()
            return iconName
        }

        static func setUpFirstTitleLine() -> String {
            let title = "Choose language to start"
            return title
        }

        static func setUpSecondTitleLine() -> String {
            let title = ""
            return title
        }

        static func setUpFeatures() -> [UIOnboardingViewConfiguration.Feature] {
            [
                .checkBox(
                    .init(
                        icon: UIImage(named: "englandLangIcon") ?? .init(),
                        title: "English",
                        selected: true
                    )
                ),
                .checkBox(
                    .init(
                        icon: UIImage(named: "germanyLangIcon") ?? .init(),
                        title: "Germany"
                    )
                ),
                .checkBox(
                    .init(
                        icon: UIImage(named: "italyLangIcon") ?? .init(),
                        title: "Italian"
                    )
                ),
                .checkBox(
                    .init(icon: UIImage(named: "sloveniaLangIcon") ?? .init(),
                          title: "Slovenian"
                         )
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
