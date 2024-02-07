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

    // MARK: - Content
    private struct WelcomePageConfiguration: UIOnboardingConfiguratable {
        static func setUpIcon() -> UIImage {
            let iconName = UIImage(named: "appIcon.dev") ?? .init()
            return iconName
        }

        static func setUpFirstTitleLine() -> String {
            let title = "Welcome to"
            return title
        }

        static func setUpSecondTitleLine() -> String {
            let title = "ANY"
            return title
        }

        static func setUpFeatures() -> [UIOnboardingViewConfiguration.Feature] {
            [
                .plain(
                    .init(
                        icon: UIImage(named: "bluetoothIcon") ?? .init(),
                        title: "Allow to use bluetooth connection",
                        description: "It's needed to scan nearby beacons and present different scenarios to you"
                    )
                ),
                .plain(
                    .init(
                        icon: UIImage(systemName: "location") ?? .init(),
                        title: "Allow to use location updates",
                        description: "It's needed to scan nearby beacons and present different scenarios to you"
                    )
                ),
                .plain(
                    .init(
                        icon: UIImage(systemName: "app.badge") ?? .init(),
                        title: "Allow to send notifications",
                        description: "It's needed to send notifications if beacons nearby"
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

        static func multiSelect() -> Bool {
            let option = true
            return option
        }
    }
}
