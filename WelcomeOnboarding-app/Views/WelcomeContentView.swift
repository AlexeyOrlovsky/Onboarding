//
//  ContentView.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 31.01.2024.
//

import SwiftUI

struct WelcomeContentView: View {
    private var withConfiguration: UIOnboardingViewConfiguration {
        UIOnboardingViewConfiguration.Onboarding.permissionsPage()
    }

    var body: some View {
        UIOnboardingContentView(
            withConfiguration: withConfiguration,
            headerTitleSize: 1 / 16,
            headerAlignment: 1 / 3,
            showJumpBackground: true,
            alignmentFeatures: 1 / 3.6,
            spacingBetwinFeatures: 1 / 68,
            iconRowSize: 1 / 20,
            showBottomBarBackground: true,
            iconRowSpacing: false
        )
    }
}

#Preview {
    WelcomeContentView()
}
