//
//  OnboardingPermissionsConfiguration.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

private typealias WelcomeOnboarding = UIOnboardingViewConfiguration.Onboarding

extension WelcomeOnboarding {
    static func permissionsPage() -> UIOnboardingViewConfiguration {
        .init(
            appIcon: WelcomePageConfiguration.setUpIcon(),
            firstTitleLine: WelcomePageConfiguration.setUpFirstTitleLine(),
            secondTitleLine: WelcomePageConfiguration.setUpSecondTitleLine(),
            features: WelcomePageConfiguration.setUpFeatures(),
            bottomBar: WelcomePageConfiguration.setUpBottomBar()
        )
    }

    // MARK: - OnboardingViewRepresentable UIOnboardingHelper
    private struct WelcomePageConfiguration: UIOnboardingConfiguratable {
        static func setUpIcon() -> String {
            let iconName = "appIcon.dev"
            return iconName
        }

        static func setUpFirstTitleLine() -> String {
            let iconName = "Welcome to"
            return iconName
        }

        static func setUpSecondTitleLine() -> String {
            let iconName = "ANY"
            return iconName
        }

        static func setUpFeatures() -> [UIOnboardingViewConfiguration.Feature] {
            var features: [UIOnboardingViewConfiguration.Feature] = .init()

            features.append(.plain(
                [
                    .init(
                        icon: "bluetoothIcon",
                        title: "Allow to use bluetooth connection",
                        description: "It's needed to scan nearby beacons and present different scenarios to you"
                    ),
                    .init(
                        icon: "location",
                        title: "Allow to use location updates",
                        description: "It's needed to scan nearby beacons and present different scenarios to you"
                    ),
                    .init(
                        icon: "app.badge",
                        title: "Allow to send notifications",
                        description: "It's needed to send notifications if beacons nearby"
                    )
                ]
            ))

            return features
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
