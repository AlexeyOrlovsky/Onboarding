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

    //    @State var headerTitleSize: CGFloat = 1 / 16
    //    @State var headerAlignment: CGFloat = 1 / 3
    //    @State var alignmentFeatures: CGFloat = 1 / 3.6
    //    @State var spacingBetwinFeatures: CGFloat = 1 / 68
    //    @State var showBottomBarBackground: Bool = true
    //    @State var multiSelect: Bool = false

    //    @State var showJumpBackground: Bool = false
    //    @State var iconRowSize: CGFloat = 1 / 18

    var body: some View {
        UIOnboardingContentView(
            withConfiguration: withConfiguration,
            navigator: nil,
            multiSelect: false,
            showJumpBackground: false
        )
    }
}

#Preview {
    WelcomeContentView()
}
