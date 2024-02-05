//
//  Feature+Extension.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 05.02.2024.
//

import SwiftUI

// MARK: - Extension
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
