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

    //    let headerTitleSize: CGFloat = 1 / 36
    //    let headerAlignment: CGFloat = 1 / 2.8
    //    let alignmentFeatures: CGFloat = 1 / 5
    //    let spacingBetwinFeatures: CGFloat = 1 / 68
    //    let showBottomBarBackground: Bool = false
    //    let multiSelect: Bool = false

    //    let showJumpBackground: Bool = true
    //    let iconRowSize: CGFloat = 1 / 18

    var body: some View {
        UIOnboardingContentView(
            withConfiguration: withConfiguration,
            navigator: { navigator.push(.welcomeView) },
            multiSelect: false, 
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
