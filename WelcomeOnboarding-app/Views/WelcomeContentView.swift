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
        UIOnboardingContentView(withConfiguration: withConfiguration)
    }
}

#Preview {
    WelcomeContentView()
}
