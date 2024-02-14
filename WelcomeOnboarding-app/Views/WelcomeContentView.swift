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
            headerTitleSize: 48,
            headerTitleSizeIsPad: 80,
            headerTitlePadding: 3.8,
            featurePadding: 4,
            onboardingRowWidth: 310,
            showBottomBarBackground: true,
            withConfiguration: withConfiguration,
            onNextAction: nil,
            multiSelect: false,
            onSelectItems: { selectedItems in
                debugPrint(selectedItems)
            },
            showWithPresentAnimation: false
        )
    }
}

#Preview {
    WelcomeContentView()
}
