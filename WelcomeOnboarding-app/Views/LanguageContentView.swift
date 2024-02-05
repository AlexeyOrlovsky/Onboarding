//
//  LanguageContentView.swift
//  WelcomeOnboarding-app
//
//  Created by developer on 03.02.2024.
//

import SwiftUI
import FlowStacks

struct LanguageContentView: View {
    private var withConfiguration: UIOnboardingViewConfiguration {
        UIOnboardingViewConfiguration.Onboarding.languagesPage()
    }

    @EnvironmentObject var navigator: AppFlowNavigator

    var body: some View {
        UIOnboardingContentView(
            withConfiguration: withConfiguration,
            headerTitleSize: 1 / 36,
            headerAlignment: 1 / 2.8,
            showJumpBackground: true,
            alignmentFeatures: 1 / 5,
            spacingBetwinFeatures: 1 / 68,
            iconRowSize: 1 / 18,
            showBottomBarBackground: false,
            iconRowSpacing: true,
            navigator: { navigator.push(.welcomeView) }
        )
    }
}

#Preview {
    LanguageContentView()
}
