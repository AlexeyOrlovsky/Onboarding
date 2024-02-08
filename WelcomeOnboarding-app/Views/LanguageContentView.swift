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

    let headerTitleSize: CGFloat = 1 / 36
    @State var headerAlignment: CGFloat = 1 / 2.8
    @State var showJumpBackground: Bool = true
    @State var alignmentFeatures: CGFloat = 1 / 5
    @State var spacingBetwinFeatures: CGFloat = 1 / 68
    @State var iconRowSize: CGFloat = 1 / 18
    @State var showBottomBarBackground: Bool = false
    @State var multiSelect: Bool = false

    var body: some View {
        UIOnboardingContentView(
            withConfiguration: withConfiguration,
            headerTitleSize: headerTitleSize,
            headerAlignment: headerAlignment,
            alignmentFeatures: alignmentFeatures,
            spacingBetwinFeatures: spacingBetwinFeatures,
            showBottomBarBackground: showBottomBarBackground,
            navigator: { navigator.push(.welcomeView) },
            multiSelect: multiSelect,
            showJumpBackground: $showJumpBackground,
            iconRowSize: $iconRowSize
        )
//        { selectedItem in
            //
//        } // TODO!
    }
}

#Preview {
    LanguageContentView()
}
