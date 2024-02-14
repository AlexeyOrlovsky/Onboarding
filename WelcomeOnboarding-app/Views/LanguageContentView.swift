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
            headerTitleSize: 24,
            headerTitleSizeIsPad: 44,
            headerTitlePadding: 3.5,
            featurePadding: 4.9,
            onboardingRowWidth: 280,
            showBottomBarBackground: false,
            onNextAction: { navigator.push(.welcomeView) },
            multiSelect: false,
            onSelectItems: { selectedItems in
                debugPrint(selectedItems)
            },
            showWithPresentAnimation: true
        )
    }
}

#Preview {
    LanguageContentView()
}
