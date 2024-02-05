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
                                swipeBackground: false,
                                positionFeatures: 1 / 5,
                                spasingBetwinFeatures: 1 / 68,
                                headerPosition: 1 / 2.8,
                                iconRowSize: 1 / 18,
                                showBottomBarBackground: false,
                                showCheckmarkInRow: true,
                                iconPadding: true,
                                show: { navigator.push(.welcomeView) }
        )
    }
}

#Preview {
    LanguageContentView()
}
