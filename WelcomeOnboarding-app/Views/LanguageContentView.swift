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
            onNextAction: { navigator.push(.welcomeView) },
            multiSelect: true,
            showJumpBackground: true
        )
//        { selectedItem in
            //
//        } // TODO!
    }
}

#Preview {
    LanguageContentView()
}
