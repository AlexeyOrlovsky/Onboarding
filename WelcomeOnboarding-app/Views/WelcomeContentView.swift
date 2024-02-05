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
        UIOnboardingContentView(withConfiguration: withConfiguration,
                                headerTitleSize: 1 / 16,
                                swipeBackground: true,
                                positionFeatures: 1 / 3.6,
                                spasingBetwinFeatures: 1 / 68,
                                headerPosition: 1 / 3,
                                iconRowSize: 1 / 20,
                                showBottomBarBackground: true,
                                showCheckmarkInRow: false,
                                iconPadding: false
        )
    }
}

#Preview {
    WelcomeContentView()
}
